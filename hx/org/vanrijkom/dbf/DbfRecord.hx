/* ************************************************************************ */
/*																			*/
/*  DBF (XBase File Reader) 												*/
/*  Copyright (c)2007 Edwin van Rijkom										*/
/*  http://www.vanrijkom.org												*/
/*																			*/
/* This library is free software; you can redistribute it and/or			*/
/* modify it under the terms of the GNU Lesser General Public				*/
/* License as published by the Free Software Foundation; either				*/
/* version 2.1 of the License, or (at your option) any later version.		*/
/*																			*/
/* This library is distributed in the hope that it will be useful,			*/
/* but WITHOUT ANY WARRANTY; without even the implied warranty of			*/
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU		*/
/* Lesser General Public License or the LICENSE file for more details.		*/
/*																			*/
/* ************************************************************************ */
/**
 * The DbfRecord class parses a record from a DBF file loade to a ByteArray.
 * To do so it requires a DbfHeader instance previously read from the 
 * ByteArray.
 * @author Edwin van Rijkom
 * @see DbfHeader
 * 
 */
// package
package org.vanrijkom.dbf;

import flash.utils.ByteArray;
import flash.utils.Dictionary;

class DbfRecord {

	/**
	 * Record field values. Use values["fieldname"] to get a value. 
	 */
	public var values : Dictionary;
	var offset : UInt;
	public function new(src : ByteArray, header : DbfHeader) {
		offset = src.position;
		values = new Dictionary();
		for(var field : DbfField in header.fields) {
			values[field.name] = src.readUTFBytes(field.length);
		}

	}

}

