/* ************************************************************************ */
/*																			*/
/*  SHP (ESRI ShapeFile Reader)												*/
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
 * Instances of the ShpError class are thrown from the SHP library classes
 * on encountering errors.
 * @author Edwin van Rijkom 
 */
// package
package org.vanrijkom.shp;

class ShpError extends Error {

	/**
	 * Defines the identifier value of an undefined error.  
	 */
	static public var ERROR_UNDEFINED : Int = 0;
	/**
	 * Defines the identifier value of a 'no data' error, which is thrown
	 * when a ByteArray runs out of data.
	 */
	static public var ERROR_NODATA : Int = 1;
	/**
	 * Constructor.
	 * @param msg
	 * @param id
	 * @return 
	 * 
	 */
	public function new(msg : String, id : Int = 0) {
		super(msg, id);
	}

}

