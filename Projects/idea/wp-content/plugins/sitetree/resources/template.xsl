<?xml version="1.0" encoding="UTF-8"?>
<!-- Copyright (c) 2012-2013 SiteTreePlugin.com - Licensed under GPL v2.0 -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">
<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" />
<xsl:template match="/">

<xsl:variable name="images" select="sitemap:urlset/sitemap:url/image:image" />

<html>
<head>
<meta charset="UTF-8" />
<meta name="robots" content="noindex" />

<title>Google Sitemap</title>

<style>
html, body, h1, p, a {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	line-height: 1;
	vertical-align: baseline;
	}

body {
	color: #333;
	font: 12px 'Helvetica Neue', Helvetica, Arial sans-serif;
	margin: 0 auto;
	max-width: 1000px;
	min-width: 600px;
	padding: 30px 20px 20px;
	}

h1 {
	color: #000;
	font-size: 30px;
	font-weight: 300;
	margin-bottom: 15px;
	}

p {
	font-size: 14px;
	line-height: 24px;
	padding: 5px 0;
	}

a {
	color: #0578B2;
	text-decoration: none;
}
a:hover { text-decoration: underline; }

table {
	border-collapse: collapse;
	margin-top: 30px;
	}

th {
	padding-bottom: 8px;
	text-align: left;
	vertical-align: bottom;
	min-width: 80px;
	width: 80px;
}
th:first-child {
	padding-left: 6px;
	width: 100%;
	}

tr:nth-child(2n) {
	background: #F5F5F5;
	border-bottom: #EEE 1px solid;
	border-top: #EEE 1px solid;
	}

td { 
	line-height: 18px;
	padding: 2px 0;
}
td:first-child {
	padding-left: 6px;
	padding-right: 40px;
	}
	td a { color: #16406F; }
	td a:hover { color: #000; }
	td a:active, td a:visited { color: #989898; }

#chfreq-head {
	min-width: 100px;
	width: 100px;
	}

#lastmod-head {
	min-width: 125px;
	width: 125px;
	}
</style>
</head>
<body>
	<h1>Google Sitemap</h1>
	<p>This document &#8212; mostly addressed to search engines &#8212; lists all the publicly accessible web pages you can find on this website.</p>
	<p>Generated by the WordPress plugin <a href="http://sitetreeplugin.com" target="_blank">SiteTree</a>. To learn more about Sitemaps, visit <a href="http://www.sitemaps.org/" target="_blank">sitemaps.org</a></p>
	<table>
		<thead>
		<tr>
			<th>URL</th>
		
		<xsl:if test="$images">
			<th>Images</th>
		</xsl:if>
			<th>Priority</th>
			<th id="chfreq-head"><abbr title="Update Frequency">Update Freq.</abbr></th>
			<th id="lastmod-head">Last Modified</th>
		</tr>
		</thead>
		<tbody>
		<xsl:for-each select="sitemap:urlset/sitemap:url"> 
			<tr>
				<xsl:variable name="url" select="sitemap:loc" />
				<td><a href="{$url}" target="sitetree"><xsl:value-of select="sitemap:loc" /></a></td>
				
				<xsl:if test="$images">
					<xsl:variable name="image_count" select="count(image:image)" />
					<xsl:choose>
						<xsl:when test="$image_count &gt; 0">
							<td><xsl:copy-of select="$image_count" /></td>
						</xsl:when>
						<xsl:otherwise>
							<td>-</td>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:if>
				
				<xsl:choose>
					<xsl:when test="sitemap:priority">
						<td><xsl:value-of select="concat(sitemap:priority * 100, '%')" /></td>
					</xsl:when>
					<xsl:otherwise>
						<td>-</td>
					</xsl:otherwise>
				</xsl:choose>
				
				<xsl:choose>
					<xsl:when test="sitemap:changefreq">
						<td><xsl:value-of select="concat(translate(substring(sitemap:changefreq, 1,1), 'hdwmyan', 'HDWMYAN'),substring(sitemap:changefreq,2))" /></td>
					</xsl:when>
					<xsl:otherwise>
						<td>-</td>
					</xsl:otherwise>
				</xsl:choose>
				
				<td><xsl:value-of select="concat(substring(sitemap:lastmod, 1,10), '&#160;&#160;@&#160;&#160;', substring(sitemap:lastmod, 12,5))" /></td>
			</tr>
		</xsl:for-each>
		</tbody>
	</table>
<script type="text/javascript">
//<![CDATA[
var rows = document.getElementsByTagName('tr');
	
for ( var i = 1; i < rows.length; i++ ) {
	var link = rows[i].children[0].childNodes[0].firstChild;
	
	link.data = decodeURI( link.data );
}
//]]>
</script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>