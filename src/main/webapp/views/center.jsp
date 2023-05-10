<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let chart = {
    init: function(){
      $.ajax({
        url:'/chart',
        success:function(result){
          chart.display(result);
        }
      })
    },
    display:function(result){
      Highcharts.chart('myAreaChart', {
        chart: {
          type: 'line'
        },
        title: {
          text: '2020년 성별에 따른 월별 구매량'
        },
        subtitle: {
          text: 'Source: ' +
                  '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                  'target="_blank">Wikipedia.com</a>'
        },
        xAxis: {
          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
        },
        yAxis: {
          title: {
            text: '총 구매금액(원)'
          }
        },
        plotOptions: {
          line: {
            dataLabels: {
              enabled: true
            },
            enableMouseTracking: false
          }
        },
        series: [{
          name: '여성',
          data: result.female
        }, {
          name: '남성',
          data: result.male
        }]
      });

    }
  };
  let center_chart1 = {
    init:function(){
      $.ajax({
        url: '/chart1',
        success: function(data){
          //alert(data);
          center_chart1.display(data);
        }
      });
    },
    display:function(data){
      Highcharts.chart('container1', {
        chart: {
          type: 'line'
        },
        title: {
          text: '성별에 따른 월별 구매금액'
        },
        subtitle: {
          text: 'Source: ' +
                  '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                  'target="_blank">이진만.com</a>'
        },
        xAxis: {
          categories: ['1월', '2월', '3월', '4월', '5월', '6월',
            '7월', '8월', '9월', '10월', '11월', '12월'],
          accessibility: {
            description: '월'
          }
        },
        yAxis: {
          title: {
            text: '총 구매금액(원)'
          }
        },
        tooltip: {
          crosshairs: true,
          shared: true
        },
        plotOptions: {
          line: {
            dataLabels: {
              enabled: true
            },
            enableMouseTracking: false
          }
        },
        series: data
      });
    }
  };
  let center_chart2 = {
    init:function(){
      $.ajax({
        url: '/chart2',
        success: function(data){
          //alert(data);
          center_chart2.display(data);
        }
      });
    },
    display: function(data){
      Highcharts.chart('container2', {
        chart: {
          type: 'column'
        },
        title: {
          text: '성별에 따른 월별 구매금액'
        },
        subtitle: {
          text: 'Source: 이진만.com'
        },
        xAxis: {
          categories: ['1월', '2월', '3월', '4월', '5월', '6월',
            '7월', '8월', '9월', '10월', '11월', '12월'],
          crosshair: true
        },
        yAxis: {
          min: 0,
          title: {
            text: '총 구매금액(원)'
          }
        },
        tooltip: {
          headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
          pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                  '<td style="padding:0"><b>{point.y:.1f}원</b></td></tr>',
          footerFormat: '</table>',
          shared: true,
          useHTML: true
        },
        plotOptions: {
          column: {
            pointPadding: 0.2,
            borderWidth: 0
          }
        },
        series: data
      });
    }
  };
  let websocket_center = {
    stompClient:null,
    init:function(){
      this.connect();
    },
    connect:function(){
      var sid = this.id;
      // var socket = new SockJS('http://127.0.0.1:8088/ws');
      var socket = new SockJS('${adminserver}/wss');
      this.stompClient = Stomp.over(socket);

      this.stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        this.subscribe('/sendadm', function(msg) {
          $('#content1_msg').text(JSON.parse(msg.body).content1);
          $('#content2_msg').text(JSON.parse(msg.body).content2);
          $('#content3_msg').text(JSON.parse(msg.body).content3);
          $('#content4_msg').text(JSON.parse(msg.body).content4);
          $('#progress1').attr('aria-valuenow', JSON.parse(msg.body).content1).css('width', JSON.parse(msg.body).content1 + '%');
          $('#progress2').attr('aria-valuenow', JSON.parse(msg.body).content2).css('width', JSON.parse(msg.body).content2/1000*100 + '%');
          $('#progress3').attr('aria-valuenow', JSON.parse(msg.body).content3).css('width', JSON.parse(msg.body).content3/500*100 + '%');
          $('#progress4').attr('aria-valuenow', JSON.parse(msg.body).content4).css('width', JSON.parse(msg.body).content4/10*100 + '%');
        });
      });
    }
  };
  $(function(){
    chart.init();
    websocket_center.init();
    center_chart1.init();
    center_chart2.init();

    setInterval(center_chart1.init, 5000);
    setInterval(center_chart2.init, 15000);
  })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
  </div>

  <!-- Content Row -->
  <div class="row">

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Earnings (Monthly)
              </div>
              <div class="row no-gutters align-items-center">
                <div class="col-auto">
                  <div id = "content1_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                </div>
                <div class="col">
                  <div class="progress progress-sm mr-2">
                    <div id="progress1" class="progress-bar bg-primary" role="progressbar"
                         style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                         aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-calendar fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Earnings (Annual) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Earnings (Annual)
              </div>
              <div class="row no-gutters align-items-center">
                <div class="col-auto">
                  <div id = "content2_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                </div>
                <div class="col">
                  <div class="progress progress-sm mr-2">
                    <div id="progress2" class="progress-bar bg-info" role="progressbar"
                         style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                         aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-danger shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Tasks
              </div>
              <div class="row no-gutters align-items-center">
                <div class="col-auto">
                  <div id = "content3_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                </div>
                <div class="col">
                  <div class="progress progress-sm mr-2">
                    <div id="progress3" class="progress-bar bg-danger" role="progressbar"
                         style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                         aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Pending Requests Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Requests
              </div>
              <div class="row no-gutters align-items-center">
                <div class="col-auto">
                  <div id = "content4_msg" class="h5 mb-0 mr-3 font-weight-bold text-gray-800"></div>
                </div>
                <div class="col">
                  <div class="progress progress-sm mr-2">
                    <div id="progress4" class="progress-bar bg-warning" role="progressbar"
                         style="width: 0%" aria-valuenow="0" aria-valuemin="0"
                         aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-comments fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Content Row -->

  <div class="row">

    <!-- Area Chart -->
    <div class="col-xl-8 col-lg-7">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div
                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
          <div class="dropdown no-arrow">
            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                 aria-labelledby="dropdownMenuLink">
              <div class="dropdown-header">Dropdown Header:</div>
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </div>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-area" id="myAreaChart"></div>
        </div>
      </div>
    </div>

    <!-- Pie Chart -->
    <div class="col-xl-4 col-lg-5">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div
                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
          <div class="dropdown no-arrow">
            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                 aria-labelledby="dropdownMenuLink">
              <div class="dropdown-header">Dropdown Header:</div>
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </div>
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-pie pt-4 pb-2">
            <canvas id="myPieChart"></canvas>
          </div>
          <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
            <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
            <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Content Row -->
  <div class="row">

    <!-- Content Column -->
    <div class="col-lg-6 mb-4">

      <!-- Project Card Example -->
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">강사님버전1</h6>
        </div>
        <div class = "chart-area" id="container1"></div>
      </div>

      <!-- Color System -->
      <div class="row">
        <div class="col-lg-6 mb-4">
          <div class="card bg-primary text-white shadow">
            <div class="card-body">
              Primary
              <div class="text-white-50 small">#4e73df</div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-4">
          <div class="card bg-success text-white shadow">
            <div class="card-body">
              Success
              <div class="text-white-50 small">#1cc88a</div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-4">
          <div class="card bg-info text-white shadow">
            <div class="card-body">
              Info
              <div class="text-white-50 small">#36b9cc</div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-4">
          <div class="card bg-warning text-white shadow">
            <div class="card-body">
              Warning
              <div class="text-white-50 small">#f6c23e</div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-4">
          <div class="card bg-danger text-white shadow">
            <div class="card-body">
              Danger
              <div class="text-white-50 small">#e74a3b</div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-4">
          <div class="card bg-secondary text-white shadow">
            <div class="card-body">
              Secondary
              <div class="text-white-50 small">#858796</div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-4">
          <div class="card bg-light text-black shadow">
            <div class="card-body">
              Light
              <div class="text-black-50 small">#f8f9fc</div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 mb-4">
          <div class="card bg-dark text-white shadow">
            <div class="card-body">
              Dark
              <div class="text-white-50 small">#5a5c69</div>
            </div>
          </div>
        </div>
      </div>

    </div>

    <div class="col-lg-6 mb-4">

      <!-- Illustrations -->
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">강사님버전2</h6>
        </div>
        <div class="card-body">
          <div class="chart-area" id="container2">
          </div>
        </div>
      </div>

      <!-- Approach -->
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
        </div>
        <div class="card-body">
          <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
            CSS bloat and poor page performance. Custom CSS classes are used to create
            custom components and custom utility classes.</p>
          <p class="mb-0">Before working with this theme, you should become familiar with the
            Bootstrap framework, especially the utility classes.</p>
        </div>
      </div>

    </div>
  </div>

</div>
<!-- /.container-fluid -->


