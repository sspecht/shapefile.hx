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
 * The ShpPoint class parses an ESRI Shapefile Polygon record from a ByteArray.
 * @author Edwin van Rijkom
 * 
 */
// package;
package org.vanrijkom.shp;

import flash.utils.ByteArray;
import flash.utils.Endian;
import flash.geom.Rectangle;
import flash.geom.Point;

class ShpPolygon extends ShpObject {

	/**
	 * Cartesian bounding box of all the rings found in this Polygon record.
	 */
	public var box : Rectangle;
	/**
	 * Array containing zero or more Arrays containing zero or more ShpPoint
	 * typed values, constituting the rings found in this Polygon record.
	 * @see ShpPoint 
	 */
	public var rings : Array<Dynamic>;
	/**
	 * Constructor.
	 * @param src
	 * @param size
	 * @return 
	 * @throws ShpError Not a Polygon record
	 */
	public function new(src : ByteArray = null, size : Int = 0) {
		type = ShpType.SHAPE_POLYGON;
		rings = [];
		if(src!=null)  {
			if( (src.length - src.position) < Std.int(size) ) throw (new ShpError("Not a Polygon record (to small)"));
			src.endian = Endian.LITTLE_ENDIAN;
			var x1 = src.readDouble();
			var y1 = src.readDouble();
			var x2 = src.readDouble();
			var y2 = src.readDouble();
			box = new Rectangle(x1, y1, x2-x1, y2-y1);
			var rc : Int = src.readInt();
			var pc : Int = src.readInt();
			var ringOffsets : Array<Dynamic> = [];
			while(rc-->0) {
				ringOffsets.push(src.readInt());
			}

			var points : Array<Dynamic> = [];
			while(pc-->0) {
				points.push(new ShpPoint(src, 16));
			}

			// convert points, and ringOffsets arrays to an array of rings:
			var removed : Int = 0;
			var split : Int;
			ringOffsets.shift();
			while(ringOffsets.length>0) {
				split = ringOffsets.shift();
				rings.push(points.splice(0, split - removed));
				removed = split;
			}

			rings.push(points);
		}
	}

}

