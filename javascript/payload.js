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
            var currentVal = $('#latestLink').attr("href");
            $('#latestLink').attr("href",currentVal + tagArray[0] + '/');
            $('#latestLink2').attr("href",currentVal + tagArray[0] + '/');
        }
    }
});
