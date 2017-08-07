

(function(){
	var myChart = echarts.init(document.getElementById("index-pie-1"));
	
	option = {
			title: {
		        text: '实验完成情况'
		    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'right',
        data:['完成','未完成','进行中']
    },
    calculable : true,
    series : [
        {
            name:'实验完成情况',
            type:'pie',
            radius : '70%',
            center: ['50%', '60%'],
            itemStyle : {
                normal : {
                    label : {
                        show : false
                    },
                    labelLine : {
                        show : false
                    }
                }
            },
            data:[
                {value:335, name:'完成'},
                {value:310, name:'未完成'},
                {value:234, name:'进行中'}
            ]
        }
    ]
};
                    
                    
	
	myChart.setOption(option);
})();


(function(){
	var myChart = echarts.init(document.getElementById("index-bar-1"));
	
	option = {
			title: {
		        text: '本周参与实验人数'
		    },
    color: ['#3398DB'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'直接访问',
            type:'bar',
            barWidth: '60%',
            data:[10, 52, 200, 334, 390, 330, 220]
        }
    ]
};


	myChart.setOption(option);
})();


(function(){
	var myChart = echarts.init(document.getElementById("flow-1"));
	
	var data = [
	            [[28604,77,17096869,'Australia',1990],[31163,77.4,27662440,'Canada',1990],[1516,68,1154605773,'China',1990],[13670,74.7,10582082,'Cuba',1990],[28599,75,4986705,'Finland',1990],[29476,77.1,56943299,'France',1990],[31476,75.4,78958237,'Germany',1990],[28666,78.1,254830,'Iceland',1990],[1777,57.7,870601776,'India',1990],[29550,79.1,122249285,'Japan',1990],[2076,67.9,20194354,'North Korea',1990],[12087,72,42972254,'South Korea',1990],[24021,75.4,3397534,'New Zealand',1990],[43296,76.8,4240375,'Norway',1990],[10088,70.8,38195258,'Poland',1990],[19349,69.6,147568552,'Russia',1990],[10670,67.3,53994605,'Turkey',1990],[26424,75.7,57110117,'United Kingdom',1990],[37062,75.4,252847810,'United States',1990]],
	            [[44056,81.8,23968973,'Australia',2015],[43294,81.7,35939927,'Canada',2015],[13334,76.9,1376048943,'China',2015],[21291,78.5,11389562,'Cuba',2015],[38923,80.8,5503457,'Finland',2015],[37599,81.9,64395345,'France',2015],[44053,81.1,80688545,'Germany',2015],[42182,82.8,329425,'Iceland',2015],[5903,66.8,1311050527,'India',2015],[36162,83.5,126573481,'Japan',2015],[1390,71.4,25155317,'North Korea',2015],[34644,80.7,50293439,'South Korea',2015],[34186,80.6,4528526,'New Zealand',2015],[64304,81.6,5210967,'Norway',2015],[24787,77.3,38611794,'Poland',2015],[23038,73.13,143456918,'Russia',2015],[19360,76.5,78665830,'Turkey',2015],[38225,81.4,64715810,'United Kingdom',2015],[53354,79.1,321773631,'United States',2015]]
	        ];

	        option = {
	            backgroundColor: new echarts.graphic.RadialGradient(0.3, 0.3, 0.8, [{
	                offset: 0,
	                color: '#f7f8fa'
	            }, {
	                offset: 1,
	                color: '#fff'
	            }]),
	            title: {
	                text: '各专业实验成绩'
	            },
	            legend: {
	                right: 10,
	                data: ['8月', '9月']
	            },
	            xAxis: {
	                splitLine: {
	                    lineStyle: {
	                        type: 'dashed'
	                    }
	                }
	            },
	            yAxis: {
	                splitLine: {
	                    lineStyle: {
	                        type: 'dashed'
	                    }
	                },
	                scale: true
	            },
	            series: [{
	                name: '1990',
	                data: data[0],
	                type: 'scatter',
	                symbolSize: function (data) {
	                    return Math.sqrt(data[2]) / 5e2;
	                },
	                label: {
	                    emphasis: {
	                        show: true,
	                        formatter: function (param) {
	                            return param.data[3];
	                        },
	                        position: 'top'
	                    }
	                },
	                itemStyle: {
	                    normal: {
	                        shadowBlur: 10,
	                        shadowColor: 'rgba(120, 36, 50, 0.5)',
	                        shadowOffsetY: 5,
	                        color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
	                            offset: 0,
	                            color: 'rgb(251, 118, 123)'
	                        }, {
	                            offset: 1,
	                            color: 'rgb(204, 46, 72)'
	                        }])
	                    }
	                }
	            }, {
	                name: '2015',
	                data: data[1],
	                type: 'scatter',
	                symbolSize: function (data) {
	                    return Math.sqrt(data[2]) / 5e2;
	                },
	                label: {
	                    emphasis: {
	                        show: true,
	                        formatter: function (param) {
	                            return param.data[3];
	                        },
	                        position: 'top'
	                    }
	                },
	                itemStyle: {
	                    normal: {
	                        shadowBlur: 10,
	                        shadowColor: 'rgba(25, 100, 150, 0.5)',
	                        shadowOffsetY: 5,
	                        color: new echarts.graphic.RadialGradient(0.4, 0.3, 1, [{
	                            offset: 0,
	                            color: 'rgb(129, 227, 238)'
	                        }, {
	                            offset: 1,
	                            color: 'rgb(25, 183, 207)'
	                        }])
	                    }
	                }
	            }]
	        };

                    
                    
	
	myChart.setOption(option);
})();

(function(){
	var myChart = echarts.init(document.getElementById("radar-1"));
	
	var base = +new Date(1968, 9, 3);
	var oneDay = 24 * 3600 * 1000;
	var date = [];

	var data = [Math.random() * 300];

	for (var i = 1; i < 20000; i++) {
	    var now = new Date(base += oneDay);
	    date.push([now.getFullYear(), now.getMonth() + 1, now.getDate()].join('/'));
	    data.push(Math.round((Math.random() - 0.5) * 20 + data[i - 1]));
	}

	option = {
	    tooltip: {
	        trigger: 'axis',
	        position: function (pt) {
	            return [pt[0], '10%'];
	        }
	    },
	    title: {
	        left: 'left',
	        text: '实验室负载情况',
	    },
	    toolbox: {
	        feature: {
	            dataZoom: {
	                yAxisIndex: 'none'
	            },
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: date
	    },
	    yAxis: {
	        type: 'value',
	        boundaryGap: [0, '100%']
	    },
	    dataZoom: [{
	        type: 'inside',
	        start: 0,
	        end: 10
	    }, {
	        start: 0,
	        end: 10,
	        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
	        handleSize: '80%',
	        handleStyle: {
	            color: '#fff',
	            shadowBlur: 3,
	            shadowColor: 'rgba(0, 0, 0, 0.6)',
	            shadowOffsetX: 2,
	            shadowOffsetY: 2
	        }
	    }],
	    series: [
	        {
	            name:'负载指数',
	            type:'line',
	            smooth:true,
	            symbol: 'none',
	            sampling: 'average',
	            itemStyle: {
	                normal: {
	                    color: 'rgb(255, 70, 131)'
	                }
	            },
	            areaStyle: {
	                normal: {
	                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
	                        offset: 0,
	                        color: 'rgb(255, 158, 68)'
	                    }, {
	                        offset: 1,
	                        color: 'rgb(255, 70, 131)'
	                    }])
	                }
	            },
	            data: data
	        }
	    ]
	};


	myChart.setOption(option);
})();
