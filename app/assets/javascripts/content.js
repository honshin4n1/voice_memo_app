window.addEventListener(
  "DOMContentLoaded",
  function () {
    const speech = new webkitSpeechRecognition();
    speech.lang = "ja-JP"; //日本語
    speech.continuous = true; //連続性
    speech.interimResults = true; //途中経過表示
    // document.getElementById や addEventListener
    const StartTitle = document.getElementById("title-btn");
    const ResultTitle = document.getElementById("contents__title");
    const StopTitle = document.getElementById("title-btn-stop");

    speech.addEventListener(
      "result",
      function (e) {
        var text = "";

        for (var i = 0; i < e.results.length; i++) {
          text += e.results[i][0].transcript;
        }
        ResultTitle.value = text;
      },
      false
    );

    StartTitle.addEventListener(
      "click",
      function () {
        ResultTitle.value = "";
        speech.start();
      },
      false
    );
    StopTitle.addEventListener(
      "click",
      function () {
        speech.stop();
      },
      false
    );
  },
  false
);

window.addEventListener(
  "DOMContentLoaded",
  function () {
    const speech = new webkitSpeechRecognition();
    speech.lang = "ja-JP"; //日本語
    speech.continuous = true; //連続性
    speech.interimResults = true; //途中経過表示
    // document.getElementById や addEventListener
    const StartComment = document.getElementById("comment-btn");
    const ResultComment = document.getElementById("contents__comment");
    const StopComment = document.getElementById("comment-btn-stop");

    speech.addEventListener(
      "result",
      function (e) {
        var text = "";

        for (var i = 0; i < e.results.length; i++) {
          text += e.results[i][0].transcript;
        }
        ResultComment.value = text;
      },
      false
    );

    StartComment.addEventListener(
      "click",
      function () {
        ResultComment.value = "";
        speech.start();
      },
      false
    );
    StopComment.addEventListener(
      "click",
      function () {
        speech.stop();
      },
      false
    );
  },
  false
);

// content登録 //
$(function () {
  function buildHTML(content) {
    var html = `
    <tr class="content-tr">
      <td class="content-title">${content.title}</td>
      <td class="content-comment">${content.comment}</td>
      <td class="content-start_time">${content.start_time}</td>
      <td class="content-updated_at">
        ${content.updated_at}
        <a class="content__edit-link" href="/genres/${content.genre_id}/contents/${content.id}/edit">
          <i class="fas fa-edit"></i>
        </a>
        <a class="content__delete-link" id="delete-btn" data-content-id="${content.id}" data-remote="true" rel="nofollow" data-method="delete" href="/genres/${content.genre_id}/contents/${content.id}">
          <i class="far fa-trash-alt"></i>
        </a>
      </td>
    </tr>
    `;
    return html;
  }
  $("#submit-content").on("click", function () {
    $(".new_content").on("submit", function (e) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr("action");
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "json",
        processData: false,
        contentType: false,
      })
        .done(function (data) {
          alert("作成しました。");
          var html = buildHTML(data);
          var now = new Date();
          var year = now.getFullYear();
          var month = now.getMonth() + 1;
          var day = now.getDate();
          var hours = now.getHours();
          var minites = now.getMinutes();
          $(".content-tbody").prepend(html);
          $(".new_content").off("submit");
          $("#contents__title").val("");
          $("#contents__comment").val("");
          $("#content_display").val("");
          $("#content_start_time_1i").val(year);
          $("#content_start_time_2i").val(month);
          $("#content_start_time_3i").val(day);
          $("#content_start_time_4i").val(hours);
          $("#content_start_time_5i").val(minites);
          $("#submit-content").prop("disabled", false);
          $("#submit-content").off("click");
        })
        .fail(function () {
          alert("エラー！作成に失敗しました。");
          $(".new_content").off("submit");
          $("#submit-content").prop("disabled", false);
        });
    });
  });
});

// content削除 //
$(function () {
  $(".contents").on("click", "#delete-btn", function (e) {
    e.preventDefault();
    var deleteData = $(this);
    var contentID = $(this).data("content-id");
    var url = $(this).attr("href");
    if (!confirm("削除しますか？")) {
      return false;
    } else {
      $.ajax({
        url: url,
        type: "DELETE",
        data: { id: contentID },
        dataType: "json",
        processData: false,
        contentType: false,
      })
        .done(function () {
          alert("削除しました。");
          deleteData.parents(".content-tr").remove();
        })
        .fail(function () {
          alert("エラー");
        });
    }
  });
});

// calendar内のcontent削除 //
$(function () {
  $(".simple-calendar").on("click", "#content-delete-link", function (e) {
    e.preventDefault();
    var deleteData = $(this);
    var contentID = $(this).data("content-id");
    var url = $(this).attr("href");
    if (!confirm("削除しますか？")) {
      return false;
    } else {
      $.ajax({
        url: url,
        type: "DELETE",
        data: { id: contentID },
        dataType: "json",
        processData: false,
        contentType: false,
      })
        .done(function () {
          alert("削除しました。");
          deleteData.parents(".contents-title").remove();
        })
        .fail(function () {
          alert("エラー");
        });
    }
  });
});
