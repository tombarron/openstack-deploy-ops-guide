// Milestones
// Fetch date and title of last milestone closed

$.ajax({
    url: "https://api.github.com/repos/netapp/openstack-deploy-ops-guide/tags?", 
    dataType: 'jsonp',
    success: function (json) {
        var tagArray;
        var k;
        alert(json);
        for (k = 0; k < json.length; ++k) 
        { 
            tagArray.push(json[k].name);
        }
        if (tagArray.length > 0)
        {
            tagArray.sort();
            tagArray.reverse();

            $('mtitle').text(tagArray[0].charAt(0).toUpperCase() + tagArray[0].slice(1));
            var currentVal = $('latestLink').text();
            $('latestLink').text(currentVal + tagArray[0] + '/');
        }
    }
});
