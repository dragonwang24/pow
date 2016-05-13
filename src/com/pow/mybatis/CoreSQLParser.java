package com.pow.mybatis;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;

import com.pow.log.LoggerService;


/**
 * 
 *  @Description:核心的SQL解析类，用于系统底层的SQL处理，如获取count的查询语句
 */
public final class CoreSQLParser {
	
	private static Logger logger = LoggerService.getTraceLogger(CoreSQLParser.class);

	/**
	 * 匹配SELECT查询的语法的正则表达式，不区分大小写，可匹配:<br>
	 * with [recursive]、select..from..where、group by、having、order by等，
	 * 其中with语法属于Teradata、SQL Server2005+等数据库的语法。<br>
	 * 按照分组与捕获的方式又具体分为：<br>
	 * group 0: 整个输入串；<br>
	 * group 1：with [recursive]语句整体或者null；<br>
	 * group 2：recursive或者null，即recursive有没有出现；<br>
	 * group 3：select子句(包含select)，或者null，例如Hibernate语句的HQL是以from开头；<br>
	 * group 4：跟在select后的子句，如查询的字段；<br>
	 * group 5：from子句(包含from)，非空；<br>
	 * group 6：跟在from后的子句，如表、视图、子查询、join子句等；<br>
	 * group 7：where子句(包含where)，或者null；<br>
	 * group 8：where子句的查询条件(不包含where)，或者null；<br>
	 * group 9：group by子句(包含关键字group by)，包含having子句，或者null；<br>
	 * group 10：having子句(包含关键字having)，或者null；<br>
	 * group 11：order by子句(包含关键字order by)，或者null；<br>
	 * 如下为一个简单的查询SQL，对其执行正则匹配，如下：
	 * <pre>
	 * with recursive n(id, level) as 
		(
		    select id, 1 from T5
		    union
		    select child_id, level+1 from n, T5 where T5.parent_id=n.id
		)
		select c1, c2, c3
		from T1 a, T2 b
		left outer join T3 c on a.abc=c.abc
		where 1=1 and a.abc=b.abc
		group by a.c1, a.c2, b.c3
		having count(*) > 10
		order by a.c1 desc, b.c3 asc
	 * </pre>
	 * 分组后的字符串子句如下：<br>
	 * group 0: 整个输入串；<br>
	 * group 1：with recursive n(id, level) as \n(...略...)\n<br>
	 * group 2：recursive<br>
	 * group 3： select c1, c2, c3 \n<br>
	 * group 4： c1, c2, c3 \n<br>
	 * group 5：from T1 a, T2 b\nleft outer join T3 c on a.abc=c.abc\n<br>
	 * group 6： T1 a, T2 b\nleft outer join T3 c on a.abc=c.abc\n<br>
	 * group 7：where 1=1 and a.abc=b.abc\n<br>
	 * group 8： 1=1 and a.abc=b.abc\n<br>
	 * group 9：group by a.c1, a.c2, b.c3\nhaving count(*) > 10\n<br>
	 * group 10：having count(*) > 10\n<br>
	 * group 11：order by a.c1 desc, b.c3 asc<br>
	 */
	private static final Pattern P_SELECT = Pattern.compile(
			 "(?ims)\\s*(with\\s+(recursive)?\\s+\\w+\\s*\\(.*\\)\\s*as\\s*\\(.+\\)\\s*)?(\\bselect\\b(.+?))?" +
			 "(\\bfrom\\b(.+?))(\\bwhere\\b(.+?))?(\\bgroup\\s+by\\b.+?(\\bhaving\\b.+?)?)?(\\border\\s+by\\b.+?)?");
	
	/**
	 * 生成COUNT子句的入口
	 * @param sql 原始SQL
	 * @return count子句
	 */
	public static String getCountSQL(String sql) {
		StringBuffer strQuery = new StringBuffer(sql);
		Matcher m = P_SELECT.matcher(strQuery);
		if (!m.matches()) {
			logger.error("error sql:\n" + sql);
//			throw new CoreSQLParserException(sql);
		}
		
		StringBuffer result = new StringBuffer(strQuery.length()+100);
		if (m.group(1) != null) {
			result.append(m.group(1));
		}
		if (m.group(9) != null) { //包含有group by子句
			result.append("select count(*) from (");
			result.append(m.group(3) != null ? m.group(3) : "");
			result.append(m.group(5));
			result.append(m.group(7) != null ? m.group(7) : "");
			result.append(m.group(9));
			result.append(") CNT_TB_");
		}
		else { //不包含group by的普通查询语句
			result.append("select count(*) ");
			result.append(m.group(5));
			result.append(m.group(7) != null ? m.group(7) : "");
		}
		return result.toString();
	}
	
	
}
