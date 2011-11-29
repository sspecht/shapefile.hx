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
 * The ShpPointZ class parses an ESRI Shapefile PointZ record from a ByteArray. 
 * @author Edwin van Rijkom
 * 
 */
// package
package org.vanrijkom.shp;

import flash.utils.ByteArray;
import flash.utils.Endian;

class ShpPointZ extends ShpPoint {

	/**
	 * Z value
	 */
	public var z : Float;
	/**
	 * M value (measure)
	 */
	public var m : Int;
	// Measure;
	/**
	 * Constructor
	 * @param src
	 * @param size
	 * @return	 
	 * 
	 */
	public function new(src : ByteArray = null, size : UInt = 0) {
		super();
		type = ShpType.SHAPE_POINT;
		if(src)  {
			z = ((size > 16)) ? src.readDouble() : NaN;
			m = ((size > 24)) ? src.readDouble() : NaN;
		}
	}

}

