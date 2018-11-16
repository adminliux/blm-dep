<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- 引入tag.jsp -->
	<%@include file="../public/tag.jsp"%>
	<!DOCTYPE html>
<html lang="en">
<head>
	<title>课程列表</title>
<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css" />
	<!-- 分页样式css -->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/matrix-style.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/bootstrap.min.css" />
<!-- 引入图片悬浮css -->
<link rel="stylesheet" id="spi-render-css-css" href="${path}/resources/imgshow/css/render.css?ver=3.5.2" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="${path}/resources/imgshow/css/default.include.b2676e.css" media="all" />
</head>
<body>
<div class="page-container">
	<!-- 条件查询start -->
	<form id="From">
	<div class="text-c">
		<span class="select-box inline">
		<select name="classifyId" class="select" onchange="findUser()" id="classifyList">
		</select>
		<script type="text/html" id="f4">
			<option value="">课程类别</option>
			{{each data as good}}
			<option value="{{good.id}}">{{good.name}}</option>
			{{/each}}
		</script>
		</span>
		&nbsp用户id
		<input type="text" name="userId" placeholder="用户id" style="width:7%">
			&nbsp&nbsp ID
		<input type="text" name="id" placeholder="ID" style="width:7%">
		&nbsp&nbsp 房间名称
		<input type="text" name="roomTitle" placeholder="房间名称" style="width:7%">
         <br>
		<a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
		<a class="btn btn-success" onclick="regist()"><i class="Hui-iconfont">&#xe665;</i> 创建课程</a>
		<br/>

		</from>

	</div>
	<!-- 条件查询end -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
	<div class="mt-20" >
		<table  >
			<thead>
				<tr class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
					<th width="120">操作</th>
					<th width="120"></th>
					<th width="80">id</th>
					<th width="140">房间名称</th>
					<th width="75">报名数量</th>
					<th width="120">老师id</th>
					<th width="120">直播间标题</th>
					<th width="120">课程状态</th>
					<th width="120">课程类别</th>
					<th width="120">封面图</th>
					<th width="120">课程地址</th>
					<th width="120">课程价格</th>
					<th width="120">课程总价</th>
					<th width="120">开始时间</th>
					<th width="120">结束时间</th>
					<th width="120">拼班结束时间</th>
					<th width="120">拼班人数</th>
					<th width="120">拼班价格</th>
					<th width="120">评论</th>
					<th width="120">简介</th>

				</tr>
			</thead>
			<tbody id="goodList">
			</tbody>
		</table>
				<script type="text/html" id="f1">
		{{each data as good}}
			<tr>

					<td style="text-align:center;vertical-align:middle;"><button type="button" class="btn btn-success" onclick="layer_show('详情','${path}/page/live/course/update/byid?id={{good.id}}','800','600')">修改</button>
					<button type="button" class="btn btn-success" onclick="down({{good.id}})">删除</button></td>
				<td>
					<button type="button" class="btn btn-success" onclick="recommendCourse({{good.id}})">推荐</button>
					<button type="button" class="btn btn-success" onclick="notRecommend({{good.id}})">取消推荐</button>
                    <a href="${page}/page/live/course/small/list?courseId={{good.id}}">小节管理</a>
				</td>
				<td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.roomTitle}}</td>
				<td style="text-align:center;vertical-align:middle;"><a href='${path}/page/live/course/join/list?liveCourseId={{good.id}}'>{{good.regiNum}}</a></td>
				<td style="text-align:center;vertical-align:middle;">{{good.userId}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.roomTitle}}</td>
				<td style="text-align:center;vertical-align:middle;">{{if good.status == "TRAILER"}}未开播{{else if good.status == "DIRECT_SEEDING"}}直播中{{else if good.status == "REVIEW"}}直播结束{{/if}}</td>
				<td style="text-align:center;vertical-align:middle;">{{if good.classifyId=="1"}}模特{{else if good.classifyId=="2"}}声乐{{else if good.classifyId=="3"}}瑜伽{{else if good.classifyId=="4"}}团舞{{else if good.classifyId=="5"}}其他{{/if}}</td>
				<td >{{if good.previewImg==NULL}}无{{else if good.previewImg!=NULL}}<a class="sit-preview" href="{{good.previewImg}}" onMouseOver="biggerr()"><img src="{{good.previewImg}}" data-preview-url="{{good.previewImg}}" style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}</td>
				<td >
					<u style="cursor:pointer" class="text-primary" onclick="member_show(' ','${path}/page/video/detail?address='+'{{good.videoUrl}}','10001','1360','800')"><font color="#4169e1">查看详情</font></u></td>
				<td style="text-align:center;vertical-align:middle;">{{good.price}}</td>
				<td style="text-align:center;vertical-align:middle;">暂无</td>
				<td style="text-align:center;vertical-align:middle;">{{if good.beginTime==NULL}}无{{else if good.beginTime!=NULL}}{{$timestampFormatYMDHM good.beginTime}}{{/if}}</td>
				<td style="text-align:center;vertical-align:middle;">{{if good.overTime==NULL}}{{else if good.overTime!=NULL}}{{$timestampFormatYMDHM good.overTime}}{{/if}}</td>
				<td style="text-align:center;vertical-align:middle;">{{if good.spellPrice==NULL}}{{else if good.spellPrice!=NULL}}{{$timestampFormatYMDHM good.spellPrice}}{{/if}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.personNum}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.spellPrice}}</td>
				<td style="text-align:center;vertical-align:middle;"><a href='${path}/page/live/course/pinlun?id={{good.id}}'>查看</a></td>
				<td style="text-align:center;vertical-align:middle;">查看</td>

			</tr>
		{{/each}}
		</script>

	</div>

	<!-- 分页 -->
	<div class="pagination alternate" align="center">
		<ul id="page"></ul>
	</div>

<script type="text/html" id="f2">
	<!-- 分页 -->
	{{if data.prePage==0}}
	<li class="disabled"><a>上一页</a></li>
	{{else}}
	<li class="disabled"><a onclick="findUser({{data.prePage}})">上一页</a></li>
	{{/if}}
		{{each data.navigatepageNums as n}}
	<li class="active"> <a onclick="findUser({{n}})">{{n}}</a> </li>
		{{/each}}
	{{if data.nextPage==0}}
	<li class="disabled"><a>下一页</a></li>
	{{else}}
	<li class="disabled"><a onclick="findUser({{data.nextPage}})">下一页</a></li>
	{{/if}}
</script>

<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${path}/resources/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${path}/resources/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="${path}/resources/static/h-ui.admin/js/H-ui.admin.js"></script>


<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<!-- 图片悬浮js -->
<script type="text/javascript" src="${path}/resources/imgshow/js/async-share.js?ver=3.5.2"></script>
<script type="text/javascript" src="${path}/resources/imgshow/js/default.include-footer.304291.js"></script>
<!-- 日期控件 -->
<script type="text/javascript" src="${path}/resources/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
    findClassify();
    var pageNum='${pageNum}';
    function findClassify() {
        Project.ajax("/global/classify/list",null,null,true).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
            findUser();
        });
    }
    function findUser(pageNow){
        if(pageNow==null){
            pageNow=1;
        }
        var unId = "${unId}";
        var classifyId=$("select[name=classifyId]").val();
        var userId=$("input[name=userId]").val();
        var id=$("input[name=id]").val();
        var roomTitle=$("input[name=roomTitle]").val();
		Project.ajax("/live/course/admin/qury",{ userId:userId,id:id,unId:unId,roomTitle:roomTitle,pageNow:pageNow,
			classifyId:classifyId},null,true).ajaxOK(function(data) {
			$("#goodList").html(template("f1",data));//作用到表格
			$("#page").html(template("f2",data));//作用到分页
			$("#total").html(data.count);//作用到统计total
			$("#size").html(data.data.size);//作用到统计每页显示size
			biggerr();//初始页
			// 面调用图片悬浮放大方法
		});
    }
    function  down(id) {
        var unId = "${unId}";
        layer.confirm('确认要把该课程删除吗？',function(index){
            Project.ajax("/live/delete/course",{id:id,unId:unId},null,true).ajaxOK(function(data) {
                layer.msg('成功!',{icon: 6,time:1000});
                findUser();//刷新
            });
        });
    }
    function regist() {
        window.location.href='${path}/page/live/course/create';
    }

    function  recommendCourse(id) {
        userRecommend(id,1);
    }
    function notRecommend(id) {
        userRecommend(id,0);
    }

    function userRecommend(id,flag) {
        layer.confirm('确认推荐/取消推荐此课程吗？',function(index) {
            Project.ajaxUploadVideoFile("/live/user/recommand",{id:id,flag:flag},null,true).ajaxOK(function(data) {
                layer.msg('成功!',{icon: 6,time:1000});
                findUser();//刷新
            });
        });
    }


    function member_stop(obj,id){//id为用户的id，obj没用到
        layer.confirm('确认要把该视频加入待审核状态吗？',function(index){
            var status ='AUDIT';//启用用户
            Project.ajax("/video/update",{id:id,status:status},null,true).ajaxOK(function(data) {
                    layer.msg('成功!',{icon: 6,time:1000});
                    findUser();//刷新
            });
        });
    }

	/*
	 * 用户-启用
	 * obj：无效
	 * id：用户id
	 * **/
	function member_start(obj,id){//id为用户的id，obj没用到
		layer.confirm('确认要启用该用户吗？',function(index){
			layer.msg('已启用!',{icon: 6,time:1000});
			var state ='0';//启用用户
			Project.ajax("/api/user/updateState",{id:id,state:state}).ajaxOK(function(data) {
                findUser();//刷新
			});
		});
	}

	/**
	 * 弹出用户信息悬浮框
	 * */
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }


	//图片悬浮事件处理
	function biggerr() {
		jQuery(".sit-preview").smartImageTooltip({
			previewTemplate : "simple",
			imageWidth : "350px"
		});
	}

    function xuanzhe(id) {
        window.location.href='${path}/page/advertisement/add?relationId='+id;
    }
	</script>

</body>
</html>