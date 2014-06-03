// Tags
// Fetch greatest tag (sorted lexigraphically); must correspond to directory name in repo

$.ajax({
    url: "https://api.github.com/repos/netapp/openstack-deploy-ops-guide/tags?", 
    dataType: 'jsonp',
    success: function (json) {
        var tagArray = [];
        var k;
        for (k = 0; k < json.data.length; ++k) 
        { 
            tagArray.push(json.data[k].name);
        }
        if (tagArray.length > 0)
        {
            tagArray.sort();
            tagArray.reverse();

            $('#mtitle').text(tagArray[0].charAt(0).toUpperCase() + tagArray[0].slice(1));
            var baseUrl = $('#latestLink').attr("href");
            latestUrl = baseUrl + tagArray[0] + '/';
            $('#latestLink').attr("href",latestUrl);
            $('#latestLink2').attr("href",latestUrl);
            $('#get-started').attr("href",latestUrl);

            var releases = "<ul class=\"active\" style=\"list-style: none\">";
            for (var i = 0; i < tagArray.length; i++ ) {
                var displayName = tagArray[i].charAt(0).toUpperCase() + tagArray[i].slice(1);
                releases += "<li><a href=\"" + baseUrl  + tagArray[i] + '/' +  "\"><i class=\"fa fa-tag\"></i>" + displayName + "</a></li>";
            }
            releases +="</ul>"
            document.getElementById("releaseList").innerHTML = releases;
        }
    }
});
