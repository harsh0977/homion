/*
---------------------------------
    : Custom - Apex Charts js :
---------------------------------
*/
"use strict";
$(document).ready(function() {
    /* -----  Apex Bar Chart ----- */
    var options = {
        maintainAspectRatio: true,
        chart: {
            height: 400,
            type: 'bar',
            toolbar: {
                show: true
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '25%',
                endingShape: 'rounded'  
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 1.5,
            colors: ['transparent']
        },
        colors: ['#14b1ab', '#ffc107', '#dc3545' ],
        series: [{
            name: 'Total Orders',
            data: [16, 17, 20, 13, 16, 20, 19]
        }, {
            name: 'Delivered',
            data: [13, 15, 14, 9, 15, 20, 17]
        }, {
             name: 'Cancelled',
            data: [3, 2, 6, 4, 1, 0, 2]
        }],
        legend: {
            show: false,
        },
        xaxis: {
            categories: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            axisBorder: {
                show: true, 
                color: 'rgba(0,0,0,0.05)'
            },
            axisTicks: {
                show: true, 
                color: 'rgba(0,0,0,0.05)'
            }
        },
        grid: {
            row: {
                colors: ['transparent', 'transparent'], opacity: .2
            },
            borderColor: 'rgba(0,0,0,0.05)'
        },
        fill: {
            opacity: 1,
        },
        tooltip: {
            y: {
                formatter: function (val) {
                    return val + " Orders"
                }
            }
        }
    }
    var chart = new ApexCharts(
        document.querySelector("#apex-bar-chart"),
        options
    );
    chart.render();
});