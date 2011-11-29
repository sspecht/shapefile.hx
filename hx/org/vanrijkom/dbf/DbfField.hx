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
 * The DbfField class parses a field definition from a DBF file loaded to a
 * ByteArray.
 * @author Edwin van Rijkom
 * 
 */
// package
package org.vanrijkom.dbf;

import flash.utils.ByteArray;
import flash.utils.Endian;

class DbfField {

	/**
	 * Field name. 
	 */
	public var name : String;
	/**
	 * Field type. 
	 */
	public var type : UInt;
	/**
	 * Field address.
	 */
	public var address : UInt;
	/**
	 * Field lenght. 
	 */
	public var length : UInt;
	/**
	 * Field decimals.
	 */
	public var decimals : UInt;
	/**
	 * Field id.
	 */
	public var id : UInt;
	/**
	 * Field set flag. 
	 */
	public var setFlag : UInt;
	/**
	 * Field index flag. 
	 */
	public var indexFlag : UInt;
	/**
	 * Constructor.
	 * @param src
	 * @return 
	 * 
	 */
	public function new(src : ByteArray) {
		name = DbfTools.readZeroTermANSIString(src);
		// fixed length: 10, so:
		src.position += (10 - name.length);
		type = src.readUnsignedByte();
		address = src.readUnsignedInt();
		length = src.readUnsignedByte();
		decimals = src.readUnsignedByte();
		// skip 2:
		src.position += 2;
		id = src.readUnsignedByte();
		// skip 2:
		src.position += 2;
		setFlag = src.readUnsignedByte();
		// skip 7:
		src.position += 7;
		indexFlag = src.readUnsignedByte();
	}

}

