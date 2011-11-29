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
 * The ShpTools class contains static tool methods for working with
 * ESRI Shapefiles.
 * @author Edwin van Rijkom
 * 
 */
// package
package org.vanrijkom.shp;

import flash.utils.ByteArray;
import flash.display.Graphics;

class ShpTools {

	/**
	 * Reads all available ESRI Shape records from the specified ByteArray.
	 * Reading starts at the ByteArrays current offset.
	 * 
	 * @param src ByteArray to read ESRI Shape records from.
	 * @return An Array containing zoomero or more ShpRecord typed values.
	 * @see ShpRecord 
	 */
	static public function readRecords(src : ByteArray) : Array<Dynamic> {
		var record : ShpRecord;
		var records : Array<Dynamic> = [];
		while(true) {
			try {
				record = new ShpRecord(src);
				records.push(record);
			}
			catch(e : ShpError) {
				if(e.errorID == ShpError.ERROR_NODATA) break
				else throw (e);
			}

		}

		return records;
	}

	/**
	* Draw all Polygon Shape records from an ESRI Shapefile using the
	* Flash drawing API.
	* @param	src
	* @param	dest
	* @param	zoom	
	* @return	Number of lines drawn.
	*/
	static public function drawPolyShpFile(src : ByteArray, dest : Graphics, zoom : Float = 1) : ShpHeader {
		var shp : ShpHeader = new ShpHeader(src);
		if(shp.shapeType != ShpType.SHAPE_POLYGON && shp.shapeType != ShpType.SHAPE_POLYLINE) throw (new ShpError("Shapefile does not contain Polygon records (found type: " + shp.shapeType + ")"));
		var records : Array<Dynamic> = ShpTools.readRecords(src);
		var i : UInt;
		for(var p : ShpRecord in records) {
			for(var r : Array<Dynamic> in (try cast(p.shape, ShpPolygon) catch(e) null).rings) {
				if(r.length)  {
					dest.moveTo(r[0].x * zoom, -r[0].y * zoom);
				}
				i = 1;
				while(i < r.length) {
					dest.lineTo(r[i].x * zoom, -r[i].y * zoom);
					i++;
				}
			}

		}

		return shp;
	}

}

