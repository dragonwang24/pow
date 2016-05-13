package com.pow.utils;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class BlobStringTypeHandler extends BaseTypeHandler<String> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i,
			String parameter, JdbcType jdbcType) throws SQLException {
		byte[] bytes = null;
		try {
			bytes = parameter.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			bytes = parameter.getBytes();
		}
		ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
	    ps.setBinaryStream(i, bis, bytes.length);
	}

	@Override
	public String getNullableResult(ResultSet rs, String columnName)
			throws SQLException {
		Blob blob = rs.getBlob(columnName);
	    byte[] returnValue = null;
	    if (null != blob) {
	      returnValue = blob.getBytes(1, (int) blob.length());
	      try {
	    	  return new String(returnValue, "UTF-8");
	      } catch (UnsupportedEncodingException e) {
	    	  return new String(returnValue);
	      }
	    }
	    return "";
	}

	@Override
	public String getNullableResult(ResultSet rs, int columnIndex)
			throws SQLException {
		Blob blob = rs.getBlob(columnIndex);
	    byte[] returnValue = null;
	    if (null != blob) {
	      returnValue = blob.getBytes(1, (int) blob.length());
	    }
	    try {
			return new String(returnValue, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return new String(returnValue);
		}
	}

	@Override
	public String getNullableResult(CallableStatement cs, int columnIndex)
			throws SQLException {
		Blob blob = cs.getBlob(columnIndex);
	    byte[] returnValue = null;
	    if (null != blob) {
	      returnValue = blob.getBytes(1, (int) blob.length());
	    }
	    try {
			return new String(returnValue, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return new String(returnValue);
		}
	}

}
