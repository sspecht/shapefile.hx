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
 * The DbfHeader class parses a DBF file loaded to a ByteArray
 * @author Edwin van Rijkom
 * 
 */
// package
package org.vanrijkom.dbf;

import flash.utils.ByteArray;
import flash.utils.Endian;

class DbfHeader {
	var recordsOffset(getRecordsOffset, never) : UInt;

	/**
	 * File length
	 */
	public var fileLength : Int;
	/**
	 * File version
	 */
	public var version : Int;
	/**
	 * Date of last update, Year.
	 */
	public var updateYear : Int;
	/**
	 * Date of last update, Month. 
	 */
	public var updateMonth : Int;
	/**
	 * Data of last update, Day. 
	 */
	public var updateDay : Int;
	/**
	 * Number of records on file. 
	 */
	public var recordCount : UInt;
	/**
	 * Header structure size. 
	 */
	public var headerSize : UInt;
	/**
	 * Size of each record.
	 */
	public var recordSize : UInt;
	/**
	 * Incomplete transaction flag 
	 */
	public var incompleteTransaction : UInt;
	/**
	 * Encrypted flag.
	 */
	public var encrypted : UInt;
	/**
	 * DBase IV MDX flag. 
	 */
	public var mdx : UInt;
	/**
	 * Language driver.
	 */
	public var language : UInt;
	/**
	 * Array of DbfFields describing the fields found
	 * in each record. 
	 */
	public var fields : Array<Dynamic>;
	var _recordsOffset : UInt;
	/**
	 * Constructor
	 * @param src
	 * @return 
	 * 
	 */
	public function new(src : ByteArray) {
		// endian:
		src.endian = Endian.LITTLE_ENDIAN;
		version = src.readByte();
		updateYear = 1900 + src.readUnsignedByte();
		updateMonth = src.readUnsignedByte();
		updateDay = src.readUnsignedByte();
		recordCount = src.readUnsignedInt();
		headerSize = src.readUnsignedShort();
		recordSize = src.readUnsignedShort();
		//skip 2:
		src.position += 2;
		incompleteTransaction = src.readUnsignedByte();
		encrypted = src.readUnsignedByte();
		// skip 12:
		src.position += 12;
		mdx = src.readUnsignedByte();
		language = src.readUnsignedByte();
		// skip 2;
		src.position += 2;
		// iterate field descriptors:
		fields = [];
		while(src.readByte() != 0x0D) {
			src.position--;
			fields.push(new DbfField(src));
		}

		_recordsOffset = headerSize + 1;
	}

	function getRecordsOffset() : UInt {
		return _recordsOffset;
	}

}

