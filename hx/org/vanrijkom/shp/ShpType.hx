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
 * The ShpType class is a place holder for the ESRI Shapefile defined
 * shape types.
 * @author Edwin van Rijkom
 * 
 */
// package
package org.vanrijkom.shp;

class ShpType {

	/**
	 * Unknow Shape Type (for internal use) 
	 */
	static public var SHAPE_UNKNOWN : Int = -1;
	/**
	 * ESRI Shapefile Null Shape shape type.
	 */
	static public var SHAPE_NULL : Int = 0;
	/**
	 * ESRI Shapefile Point Shape shape type.
	 */
	static public var SHAPE_POINT : Int = 1;
	/**
	 * ESRI Shapefile PolyLine Shape shape type.
	 */
	static public var SHAPE_POLYLINE : Int = 3;
	/**
	 * ESRI Shapefile Polygon Shape shape type.
	 */
	static public var SHAPE_POLYGON : Int = 5;
	/**
	 * ESRI Shapefile Multipoint Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_MULTIPOINT : Int = 8;
	/**
	 * ESRI Shapefile PointZ Shape shape type.
	 */
	static public var SHAPE_POINTZ : Int = 11;
	/**
	 * ESRI Shapefile PolylineZ Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_POLYLINEZ : Int = 13;
	/**
	 * ESRI Shapefile PolygonZ Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_POLYGONZ : Int = 15;
	/**
	 * ESRI Shapefile MultipointZ Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_MULTIPOINTZ : Int = 18;
	/**
	 * ESRI Shapefile PointM Shape shape type
	 */
	static public var SHAPE_POINTM : Int = 21;
	/**
	 * ESRI Shapefile PolyLineM Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_POLYLINEM : Int = 23;
	/**
	 * ESRI Shapefile PolygonM Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_POLYGONM : Int = 25;
	/**
	 * ESRI Shapefile MultiPointM Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_MULTIPOINTM : Int = 28;
	/**
	 * ESRI Shapefile MultiPatch Shape shape type
	 * (currently unsupported).
	 */
	static public var SHAPE_MULTIPATCH : Int = 31;
}

