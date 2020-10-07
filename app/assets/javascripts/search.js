window.addEventListener(
  "DOMContentLoaded",
  function () {
    const speech = new webkitSpeechRecognition();
    speech.lang = "ja-JP"; //日本語
    speech.continuous = true; //連続性
    speech.interimResults = true; //途中経過表示
    // document.getElementById や addEventListener
    const StartSearch = document.getElementById("search-btn");
    const ResultSearch = document.getElementById("search__title");
    const StopSearch = document.getElementById("search-btn-stop");

    speech.addEventListener(
      "result",
      function (e) {
        var text = "";
        for (var i = 0; i < e.results.length; i++) {
          text += e.results[i][0].transcript;
        }
        ResultSearch.value = text;
      },
      false
    );

    StartSearch.addEventListener(
      "click",
      function () {
        ResultSearch.value = "";
        speech.start();
      },
      false
    );

    StopSearch.addEventListener(
      "click",
      function () {
        speech.stop();
      },
      false
    );
  },
  false
);

// 検索 //

// $(function () {
//   function buildHTML(content) {
//     var html = `
//     <tr class="content-tr">
//       <td class="content-genre">
//         <a href="/genres/${genre_id}/contents">${genre_name}</a>
//       </td>
//       <td class="content-title">
//         ${content.title}
//       </td>
//       <td class="content-comment">
//         ${content.comment}
//       </td>
//       <td class="content-start_time">
//         ${content.start_time}
//       </td>
//       <td class="content-updated_at">
//         ${content.updated_at}
//       </td>
//     </tr>
//     `;
//     return html;
//   }
//   $("#submit-search").on("click", function () {
//     $(".new_content").on("submit", function (e) {
//       e.preventDefault();
//       var formData = $(this).val();
//       var url = $(this).attr("action");
//       console.log(formData);
//       $.ajax({
//         url: url,
//         type: "GET",
//         data: formData,
//         dataType: "json",
//         processData: false,
//         contentType: false,
//       })
//         .done(function (data) {
//           var html = buildHTML(data);
//           $("#content-tbody-search").append(html);
//           $("#new_content")[0].reset();
//           $("#submit-search").prop("disabled", false);
//           $("#submit-search").off("click");
//         })
//         .fail(function () {
//           alert("エラー！\n作成に失敗しました。");
//           $("#new_content").off("submit");
//           $("#submit-search").prop("disabled", false);
//         });
//     });
//   });
// });
