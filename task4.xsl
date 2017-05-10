<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document"
	xmlns:wklink="http://www.wkpublisher.com/xml-namespaces/links">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="//wkdoc:document">
	<html>
	  <head>
	    <meta charset="utf-8" />
	    <title>Task 4</title>
	    <style>
	    body {
			background-color: white;
			padding: 0 2em;
			font-family: Verdana, Geneva, sans-serif;
	    }
	    h1 {
			letter-spacing: 0.2ex;
	    }
	    p {
			font-style: normal; 
		}
		.scms_prov-body {
			padding: 40px;
		}
	    .scms_name_dashboard-display {
			border-radius: 10px;
			background-color: lightgrey;
			padding: 1em;
			letter-spacing: 0.3ex;
	    }
	    .hint {
			padding: 20px 30px 0;
	    }
	    .hint-arrow {
			border: 30px solid transparent; 
			border-left: 30px solid white; 
			border-top: 0; 
	    }
	    .va-related-matter {
			box-shadow: 0 0 60px rgba(0,0,0,0.7);
	    }
	    .related-matter-title {
			background-color: #3BABC2;
			color: white;
			padding: 0.5em;
	    }
	    .related-matter-body {
			padding: 1em 2.5em;
	    }
	    .related-matter-img {
			height: 1.2em;
			float: left;
			margin: 0 0.6em;
	    }
	    .related-matter-anchor {
			font-size: 0.8em;
			font-weight: bold;
			margin: 10px 0 30px;
	    }
	    .related-matter-anchor-r {
			background-color: #3BABC2;
			color: white;
			padding: 0.25em 0.5em;
			display: inline-block;
			margin-right: 0.4em;
	    }
	    .related-matter-anchor > span {
			font-size: 0.8em; 
			color: #3BABC2;
	    }
	    .scms_heading {
			font-weight: bold;
	    }
	    .scms_type_historical-explanatory-notes {
			font-style: oblique;
			margin: 1em 0;
	    }
	    </style>
	  </head>
	  <body>
	    <xsl:apply-templates />
	  </body>
	</html>
</xsl:template>

<xsl:template match="//para">
	<p>
		<xsl:apply-templates />
	</p>
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_prov-body']">
	<div class="{string(@css-class)}">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_extensible-metadata']">
	<xsl:apply-templates select=".//wkdoc:level[@css-class='scms_metadata-item scms_name_title']" />
	<xsl:apply-templates select=".//wkdoc:level[@css-class='scms_metadata-item scms_name_dashboard-display']" />
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_metadata-item scms_name_title']">
	<h1>
		<xsl:value-of select="./para" />
	</h1>
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_metadata-item scms_name_dashboard-display']">
	<div class="{string(@css-class)}">
		<xsl:value-of select="./para" />
	</div>
</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_va-object_sub-class_key-references scms_va-object_area_va-related-matter']">
	<div class="hint">
		<div class="va-related-matter">
			<div class="related-matter-title">
				<img class="related-matter-img" src="related-matter.png"/>
				<xsl:apply-templates select="./h1" />
			</div>
			<div class="related-matter-body">
				<xsl:apply-templates select="* except ./h1"/>
			</div>
		</div>
		<div class="hint-arrow"></div>
	</div>
	<div class="related-matter-anchor">
		<div class="related-matter-anchor-r"><span>R</span></div>
		<span><xsl:value-of select="./h1"/></span>
	</div>

</xsl:template>

<xsl:template match="//wkdoc:level[@css-class='scms_div scms_type_historical-explanatory-notes']">
	<div class="{string(@css-class)}">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="//h1">
	<span class="{string(@css-class)}">
		<xsl:value-of select="." />
	</span>
</xsl:template>

<xsl:template match="//wklink:cite-ref">
	<a href="{string(@search-value)}">
		<xsl:value-of select="." />
	</a>
</xsl:template>


</xsl:stylesheet>
