easy pie chart
==============

Easy pie chart is a jQuery plugin that uses the canvas element to render simple pie charts for single values.
These charts are highly customizable, very easy to implement and **scale to the resolution of the display of the client to provide sharp charts even on retina displays**.

![](https://github.com/rendro/easy-pie-chart/raw/master/img/easy-pie-chart.png)

Get started
-----------

To use the easy pie chart plugin you need to load the current version of jQuery (testet with 1.7.2) and the source (css+js) of the plugin.
Just add the following lines to the `head` of your website:

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="/path/to/jquery.easy-pie-chart.js"></script>

    <link rel="stylesheet"type="text/css" href="/path/to/jquery.easy-pie-chart.css">

The second step is to add a element to your site to represent chart and add the `data-percent` attribute with the percent number the pie chart should have:

    <div class="chart" data-percent="73">73%</div>

Finally you have to initialize the plugin with your desired configuration:

    <script type="text/javascript">
    $(function() {
        $('.chart').easyPieChart({
            //your configuration goes here
        });
    });
    </script>

Configuration parameter
-----------------------

You can pass a set of these options to the initialize function to set a custom behaviour and look for the plugin.

<table>
    <tr>
        <th>Property (Type)</th>
        <th>Default</th>
        <th>Description</th>
    </tr>
    <tr>
        <td><strong>barColor</strong></td>
        <td>#ef1e25</td>
        <td>The color of the curcular bar. You can pass either a css valid color string like rgb, rgba hex or string colors. But you can also pass a function that accepts the current percentage as a value to return a dynamically generated color.</td>
    </tr>
    <tr>
        <td><strong>trackColor</strong></td>
        <td>#f2f2f2</td>
        <td>The color of the track for the bar, false to disable rendering.</td>
    </tr>
    <tr>
        <td><strong>scaleColor</strong></td>
        <td>#dfe0e0</td>
        <td>The color of the scale lines, false to disable rendering.</td>
    </tr>
    <tr>
        <td><strong>lineCap</strong></td>
        <td>round</td>
        <td>Defines how the ending of the bar line looks like. Possible values are: <code>butt</code>, <code>round</code> and <code>square</code>.</td>
    </tr>
    <tr>
        <td><strong>lineWidth</strong></td>
        <td>3</td>
        <td>Width of the bar line in px.</td>
    </tr>
    <tr>
        <td><strong>size</strong></td>
        <td>110</td>
        <td>Size of the pie chart in px. It will always be a square.</td>
    </tr>
    <tr>
        <td><strong>animate</strong></td>
        <td>false</td>
        <td>Time in milliseconds for a eased animation of the bar growing, or false to deactivate.</td>
    </tr>
    <tr>
        <td><strong>onStart</strong></td>
        <td>$.noop</td>
        <td>Callback function that is called at the start of any animation (only if animate is not false).</td>
    </tr>
    <tr>
        <td><strong>onStop</strong></td>
        <td>$.noop</td>
        <td>Callback function that is called at the end of any animation (only if animate is not false).</td>
    </tr>
</table>


Public plugin methods
---------------------

If you want to update the current percentage of the a pie chart, you can call the `update` method. The instance of the plugin is saved in the jQuery-data.

    <script type="text/javascript">
    $(function() {
        //create instance
        $('.chart').easyPieChart({
            animate: 2000
        });
        //update instance after 5 sec
        setTimeout(function() {
            $('.chart').data('easyPieChart').update(40);
        }, 5000);
    });
    </script>

Credits
-------

Thanks to [Rafal Bromirski](http://www.paranoida.com/) for making [this dribble shot](http://drbl.in/ezuc) which inspired me and [Philip Thrasher](http://philipthrasher.com/) for his [CoffeeScript jQuery boilerplate](https://github.com/pthrasher/coffee-plate)
