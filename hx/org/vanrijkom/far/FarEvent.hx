/* ************************************************************************ */
/*																			*/
/*  FAR (Flash Archive) AS3 loader											*/
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
 * FarStream and FarItem instances trigger events when a FAR file is being
 * streamed in.
 * @see FarStream
 * @see FarItem 
 * @author Edwin van Rijkom 
 */
// package
package org.vanrijkom.far;

import flash.events.Event;

class FarEvent extends Event {

	/**
	 * Defines the value of the type property of a FarEvent object.
	 * @see FarStream 
	 */
	static public var TABLE_COMPLETE : String = "farTableComplete";
	/**
	 * Defines the value of the type property of a FarEvent object.
	 * @see FarStream 
	 */
	static public var ITEM_PROGRESS : String = "farItemProgress";
	/**
	 * Defines the value of the type property of a FarEvent object.
	 * @see FarStream 
	 */
	static public var ITEM_UNCOMPRESS : String = "farItemUncompress";
	/**
	 * Defines the value of the type property of a FarEvent object.
	 * @see FarStream 
	 */
	static public var ITEM_UNCOMPRESSED : String = "farItemUncompressed";
	/**
	 * Defines the value of the type property of a FarEvent object.
	 * @see FarStream 
	 */
	static public var ITEM_COMPLETE : String = "farItemComplete";
	/**
	 * The FarStream instance that the event applies to
	 */
	public var file : FarStream;
	/**
	 * The FarItem instance this event applies to. Will be <code>null</code> on
	 * TABLE_COMPLETE event.  
	 */
	public var item : FarItem;
	/**
	 * Set to <code>false</code> on receiving an ITEM_UNCOMPRESS event to prevent
	 * FarStream from automatically decompressing the item after the item has 
	 * finished loading.
	 */
	public var inflate : Bool;
	/**
	 * Constructor
	 * @param type
	 * @param bubbles
	 * @param cancelable
	 * @return 
	 * 
	 */
	public function new(type : String, bubbles : Bool = false, cancelable : Bool = false) {
		super(type, bubbles, cancelable);
		inflate = true;
	}

}

