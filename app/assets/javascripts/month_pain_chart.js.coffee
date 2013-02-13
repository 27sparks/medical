#  Project:
#  Description:
#  Author:
#  License:

# the semi-colon before function invocation is a safety net against concatenated
# scripts and/or other plugins which may not be closed properly.

# Note that when compiling with coffeescript, the plugin is wrapped in another
# anonymous function. We do not need to pass in undefined as well, since
# coffeescript uses (void 0) instead.
(($, window) ->
  # window is passed through as local variable rather than global
  # as this (slightly) quickens the resolution process and can be more efficiently
  # minified (especially when both are regularly referenced in your plugin).

  # Create the defaults once
  pluginName = 'monthPainChart'
  document = window.document
  defaults =
    property: 'value'

  # The actual plugin constructor
  class Plugin
    constructor: (@element, options) ->
      # jQuery has an extend method which merges the contents of two or
      # more objects, storing the result in the first object. The first object
      # is generally empty as we don't want to alter the default options for
      # future instances of the plugin
      @options = $.extend {}, defaults, options

      @_defaults = defaults
      @_name = pluginName
      @init()

    init: ->
      url = "/pain_entries.json"
      console.log('loaded')
      add_p(url)
      
    add_p= (url)->
      d3.json url, (json)->
        value_by_date = parse_data_by_date(json)
        barWidth = 20
        width = (barWidth + 1) * 31
        height = 300
        
        x = d3.scale.linear().domain([0, value_by_date.length]).range([0, width])
        y = d3.scale.linear().domain([0, d3.max(value_by_date, (datum)-> return datum )]).
          rangeRound([0, height])
        
        barDemo = d3.select("#month-pain-chart").
          append("svg:svg").
          attr("width", width).
          attr("height", height)
        
        barDemo.selectAll("rect").
          data(value_by_date).
          enter().
          append("svg:rect").
          attr("x", (datum, index)->
            return x(index) ).
          attr("y", (datum)->
            return height - y(datum) ).
          attr("height", (datum)->
            return y(datum) ).
          attr("width", barWidth).
          attr("fill", (datum)->
            value = datum
            if value >= 220
              value = 220
            red = 240
            green = 220 - value
            blue = 0
            color = "rgb("+red+","+green+","+blue+")"
            if value <= 20
              color = "#0088cc" 
            return color )
          
        #barDemo.selectAll("text").
        #  data(value_by_date).
        #  enter().
        #  append("svg:text").
        #  attr("x", (datum, index)-> return x(index) + barWidth ).
        #  attr("y", (datum)-> return height - y(datum) ).
        #  attr("dx", -barWidth/2).
        #  attr("dy", "1.2em").
        #  attr("text-anchor", "middle").
        #  text((datum)-> return datum).
        #  attr("fill", "white")
          
        barDemo.selectAll("text.yAxis").
          data(value_by_date).
          enter().append("svg:text").
          attr("x", (datum, index)-> return x(index) + barWidth ).
          attr("y", height - 3 ).
          attr("dx", -barWidth/2).
          attr("text-anchor", "middle").
          attr("style", "font-size: 11;").
          text((d, index)-> return index+1).
          attr("fill", "white").
          attr("class", "yAxis")
      
      parse_data_by_date= (data)->
        array = []
        for x in [0..30]
          array[x] = 16
        for i,datum of data
          date = parseInt(datum.date.substr(-2))
          if array[date-1]
            array[date-1] = array[date-1] + datum.value
          else
            array[date-1] = datum.value
            
        return array

    
    

  # A really lightweight plugin wrapper around the constructor,
  # preventing against multiple instantiations
  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(this, "plugin_#{pluginName}")
        $.data(@, "plugin_#{pluginName}", new Plugin(@, options))
)(jQuery, window)

