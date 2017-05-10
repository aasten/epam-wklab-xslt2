<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:wkdoc="http://www.wkpublisher.com/xml-namespaces/document">

<xsl:output method="html" doctype-system="about:legacy-compat" />

<xsl:template match="//wkdoc:document">
	<html>
	  <head>
	    <meta charset="utf-8" />
	    <title>Task 4</title>
	    <style>
	    h1 {
			letter-spacing: 0.2ex;
	    }
	    body {
			background-color: white;
	    }
	    .scms_name_dashboard-display {
			border-radius: 5px;
			background-color: lightgrey;
			padding: 1em;
			letter-spacing: 0.3ex;
	    }
	    .va-related-matter {
			box-shadow: 0 0 10px rgba(0,0,0,0.5);
	    }
	    .related-matter-title {
			background-color: #3BABC2;
			color: white;
	    }
	    .hint-arrow {
			border: 20px solid transparent; 
			border-left: 20px solid; 
			border-top: 20px solid; 
	    }
	    </style>
	  </head>
	  <body>
	    <xsl:apply-templates />
	  </body>
	</html>
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
	<div class="scms_name_dashboard-display">
		<xsl:value-of select="./para" />
	</div>
</xsl:template>

</xsl:stylesheet>
