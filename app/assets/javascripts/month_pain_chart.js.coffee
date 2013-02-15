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
      @init(options)
    
    init: (options) ->
      url = "/pain_entries.json?date="+ options[0]
      days_in_month = options[1]
      add_pain_chart(url, days_in_month, "value")
      
      $('.chart-select')
        .click ->
          kind = $(this).attr('data-chart')
          attr = $(this).attr('data-attr')
          url = "/" + kind + ".json?date="+ options[0]
          $('#month-pain-chart').html('')
          add_pain_chart(url, days_in_month, attr)
          
    add_pain_chart= (url, days_in_month, attr)->
      d3.json url, (json)->
        value_by_day = group_value_by_day(json, attr)
        barWidth = ($("#month-pain-chart").width() / days_in_month ) - 1
        barWidth = 15 if barWidth <= 15
        width = (barWidth + 1) * days_in_month
        height = width / 2
        height = 200 if height <= 200
        
        x = d3.scale.linear().domain([0, value_by_day.length]).range([0, width])
        y = d3.scale.linear().domain([0, d3.max(value_by_day, (datum)-> return datum )]).
          rangeRound([0, height])
        
        barDemo = d3.select("#month-pain-chart").
          append("svg:svg").
          attr("width", width).
          attr("height", height)
        
        barDemo.selectAll("rect").
          data(value_by_day).
          enter().
          append("svg:rect").
          attr("x", (datum, index)-> return x(index) ).
          attr("y", (datum)-> return height - y(datum)-10 ).
          attr("height", (datum)-> return y(datum)-10 ).
          attr("width", barWidth).
          attr("fill", (datum)->
            datum = 220 if datum >= 220 
            green = 220 - datum
            color = "rgb(240," + green + ",0)"
            color = "#0088cc" if datum <= 20
            return color )
          
        barDemo.selectAll("text.yAxis").
          data(value_by_day).
          enter().
          append("svg:text").
          attr("x", (datum, index)-> return x(index) + barWidth ).
          attr("y", height - 3 ).
          attr("dx", -barWidth/2).
          attr("text-anchor", "middle").
          attr("style", "font-size: 11;").
          text((d, index)-> return index+1).
          attr("fill", "black").
          attr("class", "yAxis")
      
      group_value_by_day= (data, attr)->
        array = []
        array.length = 0
        for x in [0..days_in_month - 1]
          array[x] = 0
        for i,datum of data
          if array[datum.day-1]
            array[datum.day-1] = array[datum.day-1] + datum[attr]
          else
            array[datum.day-1] = datum[attr]            
        return array

        
  # A really lightweight plugin wrapper around the constructor,
  # preventing against multiple instantiations
  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(this, "plugin_#{pluginName}")
        $.data(@, "plugin_#{pluginName}", new Plugin(@, options))
)(jQuery, window)

