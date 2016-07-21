function preLoadab() {
    if (!this.support.loading) {
        layer.alert("您的浏览器没有安装Flash Player 9.028 或其以上版本，请安装后再使用文件上传功能");
        return false;
    }
}
function loadFailedab() {
    layer.alert("文件上传功能操作失败，请联系网站维护人员");
}
function fileQueueErrorab(file, errorCode, message) {
    try {
        var imageName = "error.gif";
        var errorName = "";
        if (errorCode === SWFUpload.errorCode_QUEUE_LIMIT_EXCEEDED) {
            errorName = "文件上传功能操作失败，请联系网站维护人员";
        }

        if (errorName !== "") {
            layer.alert("文件上传功能操作失败，请联系网站维护人员");
            return;
        }

        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                imageName = "zerobyte.gif";
                layer.alert("文件大小为0kb，请重新上传");
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                imageName = "toobig.gif";
                layer.alert("文件大小超过允许的最大值");
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
            default:
                layer.alert("文件上传失败，请刷新页面后重新上传");
                //replayImageab("images/" + imageName);
                break;
        }

    } catch (ex) {
        this.debug(ex);
    }

}
//function replayImageab(src) {
//    
//    var newImg = document.createElement("img");
//    //newImg.style.margin = "5px";
////    newImg.style.width = "82px";
////    newImg.style.height = "83px";
//    newImg.setAttribute("id", "imgheadab");
//    //document.getElementById("thumbnails").empty();
//    document.getElementById("thumbnailsab").innerHTML = "";
//    document.getElementById("thumbnailsab").appendChild(newImg);
////    if (newImg.filters) {
////        try {
////            newImg.filters.item("DXImageTransform.Microsoft.Alpha").opacity = 0;
////        } catch (e) {
////            // If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
////            newImg.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + 0 + ')';
////        }
////    } else {
//        newImg.style.opacity = 0;
////    }

//    newImg.onload = function () {
//        fadeIn(newImg, 0);
//    };
//    newImg.src = src; 
//   // beAbstract2();
//}

function replayImageab(src) {


    var newImg = document.createElement("img");
    newImg.setAttribute("id", "imgheadab");
    document.getElementById("thumbnailsab").innerHTML = "";
    document.getElementById("thumbnailsab").appendChild(newImg);
    newImg.style.opacity = 0;
    newImg.onload = function () {
        fadeIn(newImg, 0);
    };
    newImg.src = "../" + src;
    beAbstract2();
}

function fileDialogCompleteab(numFilesSelected, numFilesQueued) {
    try {
        if (numFilesQueued > 0) {
            this.startUpload();
        }
    } catch (ex) {
        this.debug(ex);
    }
}

function uploadProgressab(file, bytesLoaded) {
    try {
        var percent = Math.ceil((bytesLoaded / file.size) * 100);

        var progress = new FileProgress(file, this.customSettings.upload_target);
        progress.setProgress(percent);
        if (percent === 100) {
            progress.setStatus("文件上传成功");
            progress.toggleCancel(false, this);
        } else {
            progress.setStatus("正在上传(" + percent + " %)请稍候...");
            progress.toggleCancel(true, this);
        }
    } catch (ex) {
        this.debug(ex);
    }

}

function uploadSuccessab(file, serverData) {
    try {
        //   replayImageab("saveimgfile2.aspx?command=preview&id=" + serverData);   以前一直使用的方法
        var jsonSrc = jQuery.parseJSON(serverData); 
        replayImageab(jsonSrc.FilePath);
        var progress = new FileProgress(file, this.customSettings.upload_target);

        progress.setStatus("Thumbnail Created.");
        progress.toggleCancel(false);


    } catch (ex) {
        this.debug(ex);
    }
}
function uploadSuccess2(file, serverData) {
    try {
        addfile2(serverData);

        var progress = new FileProgress(file, this.customSettings.upload_target);

        progress.setStatus("Thumbnail Created.");
        progress.toggleCancel(false);


    } catch (ex) {
        this.debug(ex);
    }
}

function uploadCompleteab(file) {
    try {
        /*  I want the next upload to continue automatically so I'll call startUpload here */
        if (this.getStats().files_queued > 0) {
            this.startUpload();
        } else {
            var progress = new FileProgress(file, this.customSettings.upload_target);
            progress.setComplete();
            progress.setStatus(""); //All images received
            progress.toggleCancel(false);
        }
    } catch (ex) {
        this.debug(ex);
    }
}

function uploadErrorab(file, errorCode, message) {
    var imageName = "error.gif";
    var progress;
    try {
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                try {
                    progress = new FileProgress(file, this.customSettings.upload_target);
                    progress.setCancelled();
                    progress.setStatus("Cancelled");
                    progress.toggleCancel(false);
                }
                catch (ex1) {
                    this.debug(ex1);
                }
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                try {
                    progress = new FileProgress(file, this.customSettings.upload_target);
                    progress.setCancelled();
                    progress.setStatus("Stopped");
                    progress.toggleCancel(true);
                }
                catch (ex2) {
                    this.debug(ex2);
                }
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                imageName = "uploadlimit.gif";
                layer.alert("图片加载失败");
                break;
            default:
                layer.alert("图片加载失败");
                break;
        }

        //	addImage("images/" + imageName);

    } catch (ex3) {
        this.debug(ex3);
    }

}


function addImage(src) {
    var newImg = document.createElement("img");
    newImg.style.margin = "5px";

    document.getElementById("thumbnailsab").appendChild(newImg);
    if (newImg.filters) {
        try {
            newImg.filters.item("DXImageTransform.Microsoft.Alpha").opacity = 0;
        } catch (e) {
            // If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
            newImg.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + 0 + ')';
        }
    } else {
        newImg.style.opacity = 0;
    }

    newImg.onload = function () {
        fadeIn(newImg, 0);
    };
    newImg.src = src;
}
function addfile(dataid) {
    //  layer.alert(dataid);
    // var newfile = document.createElement("li");

    var s = [];

    s.push('<li data-pid="" class="tsuc">');
    s.push(' <p class="file clearfix">');
    s.push('<span class="fl">' + dataid + '</span> <a style="display: inline;" href="javascript:;" onclick="deletefile(this);">删除</a></p>');
    //  s.push(' <p class="fl">');
    //  s.push(' 上传成功!</p>');
    //   s.push(' <a action-type="cancel" class="fr" href="javascript:;" onclick="delfile(this);">取消</a>');
    s.push(' </li>');

    //    newfile.setAttribute("data-pid", dataid); //增加唯一id
    //    newfile.addClass("tsuc");
    var str = s.join("");
    document.getElementById("divFileProgressContainerab").innerHTML = "";

}
function addfile2(dataid) {
    var s = [];

    s.push('<li data-pid="" class="tsuc" style="list-style-type:none;">');
    s.push(' <p class="file clearfix">');
    s.push('<span  style="border:0;">' + dataid + '</span>&nbsp;&nbsp; <a style="display: inline;color: #0A81A7;cursor: pointer;font-size: 12px;" href="javascript:;" onclick="deletefile2(this);">删除</a></p>');
    //  s.push(' <p class="fl">');
    //  s.push(' 上传成功!</p>');
    //   s.push(' <a action-type="cancel" class="fr" href="javascript:;" onclick="delfile(this);">取消</a>');
    s.push(' </li>');

    //    newfile.setAttribute("data-pid", dataid); //增加唯一id
    //    newfile.addClass("tsuc");
    var str = s.join("");
    document.getElementById("upsrc-filelist-box").innerHTML += str;
}
/* ******************************************
*	FileProgress Object
*	Control object for displaying file info
* ****************************************** */

function FileProgress(file, targetID) {
    this.fileProgressID = "divFileProgress";

    this.fileProgressWrapper = document.getElementById(this.fileProgressID);
    if (!this.fileProgressWrapper) {
        this.fileProgressWrapper = document.createElement("div");
        this.fileProgressWrapper.className = "progressWrapper";
        this.fileProgressWrapper.id = this.fileProgressID;

        this.fileProgressElement = document.createElement("div");
        this.fileProgressElement.className = "progressContainer";

        var progressCancel = document.createElement("a");
        progressCancel.className = "progressCancel";
        progressCancel.href = "#";
        progressCancel.style.visibility = "hidden";
        progressCancel.appendChild(document.createTextNode(" "));

//        var progressText = document.createElement("div");
//        progressText.className = "progressName";
//        progressText.appendChild(document.createTextNode(file.name));

        var progressBar = document.createElement("div");
        progressBar.className = "progressBarInProgress";

        var progressStatus = document.createElement("div");
        progressStatus.className = "progressBarStatus";
        progressStatus.innerHTML = "&nbsp;";

        this.fileProgressElement.appendChild(progressCancel);
        this.fileProgressElement.appendChild(progressText);
        this.fileProgressElement.appendChild(progressStatus);
        this.fileProgressElement.appendChild(progressBar);

        this.fileProgressWrapper.appendChild(this.fileProgressElement);

        document.getElementById(targetID).appendChild(this.fileProgressWrapper);
        fadeIn(this.fileProgressWrapper, 0);

    } else {
        this.fileProgressElement = this.fileProgressWrapper.firstChild;
        this.fileProgressElement.childNodes[1].firstChild.nodeValue = file.name;
    }

    this.height = this.fileProgressWrapper.offsetHeight;

}
FileProgress.prototype.setProgress = function (percentage) {
    this.fileProgressElement.className = "progressContainer green";
    this.fileProgressElement.childNodes[3].className = "progressBarInProgress";
    this.fileProgressElement.childNodes[3].style.width = percentage + "%";
};
FileProgress.prototype.setComplete = function () {
    this.fileProgressElement.className = "progressContainer blue";
    this.fileProgressElement.childNodes[3].className = "progressBarComplete";
    this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setError = function () {
    this.fileProgressElement.className = "progressContainer red";
    this.fileProgressElement.childNodes[3].className = "progressBarError";
    this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setCancelled = function () {
    this.fileProgressElement.className = "progressContainer";
    this.fileProgressElement.childNodes[3].className = "progressBarError";
    this.fileProgressElement.childNodes[3].style.width = "";

};
FileProgress.prototype.setStatus = function (status) {
    this.fileProgressElement.childNodes[2].innerHTML = status;
};

FileProgress.prototype.toggleCancel = function (show, swfuploadInstance) {
    this.fileProgressElement.childNodes[0].style.visibility = show ? "visible" : "hidden";
    if (swfuploadInstance) {
        var fileID = this.fileProgressID;
        this.fileProgressElement.childNodes[0].onclick = function () {
            swfuploadInstance.cancelUpload(fileID);
            return false;
        };
    }
};

function fadeIn(element, opacity) {
    var reduceOpacityBy = 5;
    var rate = 30; // 15 fps


    if (opacity < 100) {
        opacity += reduceOpacityBy;
        if (opacity > 100) {
            opacity = 100;
        }

        if (element.filters) {
            try {
                element.filters.item("DXImageTransform.Microsoft.Alpha").opacity = opacity;
            } catch (e) {
                // If it is not set initially, the browser will throw an error.  This will set it if it is not set yet.
                element.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + opacity + ')';
            }
        } else {
            element.style.opacity = opacity / 100;
        }
    }

    if (opacity < 100) {
        setTimeout(function () {
            fadeIn(element, opacity);
        }, rate);
    }
}

