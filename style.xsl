<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <body>
        <h1>Scout Activity Badges</h1>

        <xsl:for-each select="badges/badge[@type='activity']">
          <xsl:sort select="name" order="ascending"/>

          <div>
            <h2><xsl:value-of select="name"/></h2>
            <p><xsl:value-of select="description"/></p>

            <table border="1" cellpadding="4">
              <tr>
                <th>Level</th>
                <th>Status</th>
              </tr>
              <xsl:for-each select="levels/availability">
                <tr>
                  <td>
                    <xsl:choose>
                      <xsl:when test="@level='beaver'">Beaver</xsl:when>
                      <xsl:when test="@level='cub'">Cub</xsl:when>
                      <xsl:otherwise>Scout</xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td><xsl:value-of select="."/></td>
                </tr>
              </xsl:for-each>
            </table>
          </div>
          <hr/>

        </xsl:for-each>

        <p><i>&#xA9; College Productions Ltd</i></p>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>