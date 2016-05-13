package com.pow.utils;

import java.util.UUID;

public class PKGenerator {

	public static String generate(){
		return UUID.randomUUID().toString();
	}
}
