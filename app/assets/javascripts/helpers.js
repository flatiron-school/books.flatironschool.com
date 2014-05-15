// Calls function on $ if it is an existing piece of dom.
// $('foo.bar').exists(function(){$("#target").show();}) -> foo.bar will appear where foo.bar is present
// $('foo.baz').exists(function(){$("#target").show();}) -> foo.baz will not appear where foo.baz is not present
jQuery.fn.exists = function(func){if (this[0]) {if (func){func.apply(this, arguments);} else {return true;}} else {if (func){return this;} else {return false;}};};
