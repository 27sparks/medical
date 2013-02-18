(($, window) ->
  pluginName = 'monthPainChart'
  document = window.document
  defaults =
    property: 'value'

  class Plugin
    constructor: (@element, options) ->
      @options = $.extend {}, defaults, options
      @_defaults = defaults
      @_name = pluginName
      @init(options)
    
    init: (options) ->
      url = "/pain_entries.json?date="+ options[0]
      days_in_month = options[1]
      add_chart(url, days_in_month, "value")
      
      $('.chart-select')
        .click ->
          source = $(this).attr('data-source')
          attr = $(this).attr('data-attr')
          url = "/" + source + ".json?date="+ options[0]
          $('#month-pain-chart').html('')
          add_chart(url, days_in_month, attr)
          
    add_chart= (url, days_in_month, attr)->
      d3.json url, (json)->
        value_by_day = group_value_by_day(json, attr)
        barWidth = ($("#month-pain-chart").width() / days_in_month ) - 1
        barWidth = 15 if barWidth <= 15
        width = (barWidth + 1) * days_in_month - 20
        height = width / 2
        height = 200 if height <= 200
        padding = 20
        
        x = d3.scale.linear().domain([value_by_day.length, 0]).range([width, 0])
        y = d3.scale.linear().domain([0, d3.max(value_by_day, (datum)-> return datum.value )]).
          rangeRound([0, height])
        
        chart = d3.select("#month-pain-chart").
          append("svg:svg").
          attr("width", width + padding).
          attr("height", height + padding)
        
        chart.selectAll("rect").
          data(value_by_day).
          enter().
          append("svg:a"). 
          attr("xlink:href", (datum, index)-> return "/day/#{datum.date}").
          append("svg:rect").
          attr("y", (datum)-> return height - y(datum.value) ).
          attr("x", (datum,i)-> return x(i) + padding).
          attr("height", (datum)-> 
            return y(datum.value) ).
          attr("width", barWidth).
          attr( "fill", (datum)->
            datum.value = 220 if datum.value >= 220 
            green = 220 - datum.value
            color = "rgb(240," + green + ",0)"
            if datum.value <= 10
              color = "#0088cc"
            return color)

        chart.selectAll("path").     #whats wrong with this damn line
          data(value_by_day).
          enter().
          append("svg:path").
          attr("y", (datum)-> return height - y(datum.value) ).
          attr("x", (datum,i)-> return x(i))
                            
        xAxis = d3.svg.axis()
          .scale( d3.scale.linear().domain([value_by_day.length + 1, 1]).range([width, 0]))
          .tickSize(0,0).ticks(30).tickPadding(10).orient("bottom")
        
        yAxis = d3.svg.axis()
          .scale(d3.scale.linear().domain([d3.max(value_by_day, (datum)-> return datum.value ), 0]).rangeRound([0, height]))
          .tickSize(0,1).orient("left")
          
        chart.append("g")
          .attr("transform", "translate(#{padding},0)")
          .call(yAxis)
        chart.append("g")
          .attr("transform", "translate(#{padding + barWidth / 2 },#{height})")
          .call(xAxis)

      group_value_by_day= (data, attr)->
        array = []
        array.length = 0
        yearmonth = "#{data[0].year}-#{data[0].month}-" # hack for getting date for rect links
        for x in [0..days_in_month - 1]
          array[x] = { "value": 2, "date": "#{yearmonth}#{x+1}" }
        for i,datum of data
          if array[datum.day-1]
            array[datum.day-1] = { "value" : (array[datum.day-1].value + datum[attr]), "date": datum.date }
          else
            array[datum.day-1] = { "value" : datum[attr], "date": datum.date }
        return array

  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(this, "plugin_#{pluginName}")
        $.data(@, "plugin_#{pluginName}", new Plugin(@, options))
)(jQuery, window)

