<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>广告发布</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${path}/resources/area/jquery.inputbox.css" />
    <link type="text/css" href="${path}/kindEditor/themes/default/default.css" />
    <link type="text/css" href="${path}/kindEditor/plugins/code/prettify.css" />
    <link type="text/css" rel="stylesheet" href="${path}/kindEditor/themes/default/default.css " />


    <link type="text/css" rel="stylesheet" href="${path}/resources/uploadimg/control/css/zyUpload.css" />




</head>
<body>
<!--对话框  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" style="width: 800px;">

    <div class="modal-dialog" role="document" style="width: 800px;">

        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>

            <div class="modal-body">
                <div id="demo" class="demo"></div>
            </div>

            <div class="modal-footer">
                <button type="button" id="btn_submit" class="btn btn-primary"
                        data-dismiss="modal">
                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>关闭
                </button>
            </div>

        </div>
    </div>
</div>

<div class="page-container" id="classifyList2">


</div>

<script type="text/html" id="f5">
    <br>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标题：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="title" value="{{data.title}}">
        </div>
    </div>
    <br>

    <%--<div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>地址：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="title" value="{{data.address}}">
        </div>
    </div>--%>
    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>图片：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <img width="120" height="120" id="zhaopian" src="{{data.address}}">
            <input type="file" id="imgUrl" onchange="preview(this)"/>
            <input type="hidden" name="previewImg" value="{{data.address}}"/>

        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分享数量：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="shareSum" value="{{data.shareSum}}">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发布时间：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="名称" name="gmtDatetime" value="{{$timestampFormatYMDHM data.gmtDatetime}}" disabled ="true">
        </div>
    </div>
    <br>


    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>点赞数量：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <input type="text" class="input-text" placeholder="点赞数量" name="praise" value="{{data.praise}}">
        </div>
    </div>
    <br>

    <div class="row cl">
        <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>是否置顶：</label>
        <div class="formControls col-xs-8 col-sm-9">
            <select name="classifyId" class="select" id="classifyList">

            </select>

        </div>
    </div>



    <div class="row cl">
        <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
            <input class="btn btn-primary radius" id="btn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="release()">
        </div>
    </div>
</script>
<script type="text/html" id="f4">
    {{each data as good}}
    <option value="{{good.id}}">{{good.name}}</option>
    {{/each}}
</script>

<%@include file="../base/footer.jsp"%>

<script type="text/javascript">
    findVideo();
    function findClassify(id) {
        Project.ajax("/global/classify/list/yes",null,null,true).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
            $("#classifyList option[value='"+id+"']").attr("selected",true);
        });
    }

    function findVideo() {
        var id="${id}";

        $.ajax({
            type: 'POST',
              url: 'https://api.ibailemeng.com/api/json/piazza/piazza/detail',
            //   url:'http://localhost:8090/meng-api-1.0/api/json/piazza/piazza/detail',
            data: {"piazzaId": id},
            async: false,
            success: function (data) {
                var jsonObj = JSON.parse(data);
                findClassify(jsonObj.data.isTop);
                console.log(jsonObj);
                $("#classifyList2").html(template("f5", jsonObj));//作用到表格
                /*$("#page").html(template("f2", jsonObj));//作用到分页*/

            }
        });
    }




    function release() {
        var btn = document.getElementById('btn');
        btn.value = '上传中..';//将按钮value值改为同意
        btn.disabled = true;//将按钮disabled值改为false
        var piazzaId="${id}";
         var title=$("input[name=title]").val();
        var shareSum=$("input[name=shareSum]").val();
        var praise=$("input[name=praise]").val();
        var address=$("input[name=previewImg]").val();
        var isTop=$("select[name=classifyId]").val();
        alert(isTop);
//        var fd = new FormData();
//        alert(id);
//        fd.append("classifyId",classifyId);
//        fd.append("address",previewImg);
//        fd.append("title",title);
//        fd.append("piazzaId",piazzaId);
//        fd.append("shareSum",shareSum);
//        fd.append("praise",praise);


        $.ajax({
            type: 'POST',
             url: 'https://api.ibailemeng.com/api/json/piazza/update',
           // url:'http://localhost:8090/meng-api-1.0/api/json/piazza/update',
            data: {"piazzaId": piazzaId,shareSum:shareSum,address:address,title:title,praise:praise,isTop:isTop},
            async: false,
            success: function (data) {
                alert("上传成功！");
              //  var jsonObj = JSON.parse(data);
            //    console.log(jsonObj);
              //  $("#classifyList2").html(template("f5", jsonObj));//作用到表格
                /*$("#page").html(template("f2", jsonObj));//作用到分页*/
                btn.value = '提交';//将按钮value值改为同意
                btn.disabled = false;//将按钮disabled值改为false
            }
        });

    }

    function preview(file) {
        var fd = new FormData();
        fd.append("files",file.files[0]);
        Project.ajaxUploadFiles(fd).ajaxOK(function(data) {
            $("#zhaopian").attr("src",data.data[0]);
            $("input[name=previewImg]").val(data.data[0]);
        });
    }



</script>
</body>
</html>