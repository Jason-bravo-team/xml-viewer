<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html"/>

  <xsl:template match="/">
    <html>
      <head>
        <style>
          * { margin: 0; padding: 0; box-sizing: border-box; }
          body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
            padding: 18px;
            color: #fff;
          }
          .header {
            text-align: center;
            margin-bottom: 16px;
          }
          .header h1 {
            font-size: 26px;
            letter-spacing: 2px;
            text-transform: uppercase;
            background: linear-gradient(90deg, #f7971e, #ffd200);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
          }
          .header p {
            font-size: 12px;
            color: #8ec8e8;
            margin-top: 4px;
          }
          .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 14px;
            max-width: 1100px;
            margin: 0 auto;
          }
          .card {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 12px;
            padding: 14px;
            backdrop-filter: blur(6px);
            transition: transform 0.2s;
            display: flex;
            flex-direction: column;
            gap: 8px;
          }
          .card:hover {
            transform: translateY(-3px);
            border-color: #ffd200;
          }
          .card-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
          }
          .card-top {
            display: flex;
            align-items: center;
            gap: 10px;
          }
          .card h2 {
            font-size: 15px;
            font-weight: 600;
            color: #ffd200;
            line-height: 1.2;
          }
          .card .desc {
            font-size: 11px;
            color: #b0c4d8;
            line-height: 1.4;
            flex-grow: 1;
          }
          .levels {
            display: flex;
            gap: 6px;
            flex-wrap: wrap;
          }
          .level-tag {
            font-size: 10px;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 20px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
          }
          .level-beaver { background: #4fc3f7; color: #0a1929; }
          .level-cub   { background: #81c784; color: #0a1929; }
          .level-scout  { background: #ffb74d; color: #0a1929; }
          .level-na     { background: rgba(255,255,255,0.1); color: #607d8b; text-decoration: line-through; }
          .footer {
            text-align: center;
            margin-top: 16px;
            font-size: 11px;
            color: #607d8b;
          }
        </style>
      </head>
      <body>
        <div class="header">
          <h1>Scout Activity Badges</h1>
          <p>All activity badges sorted A&#x2013;Z with level availability</p>
        </div>

        <div class="grid">
          <xsl:for-each select="badges/badge[@type='activity']">
            <xsl:sort select="name" order="ascending"/>
            <div class="card">
              <div class="card-top">
                <div class="card-icon">
                  <xsl:attribute name="style">
                    background: linear-gradient(135deg,
                    <xsl:choose>
                      <xsl:when test="position() mod 4 = 1">#f7971e, #ffd200</xsl:when>
                      <xsl:when test="position() mod 4 = 2">#4fc3f7, #0288d1</xsl:when>
                      <xsl:when test="position() mod 4 = 3">#81c784, #388e3c</xsl:when>
                      <xsl:otherwise>#ce93d8, #7b1fa2</xsl:otherwise>
                    </xsl:choose>
                    );
                  </xsl:attribute>
                  <xsl:value-of select="substring(name, 1, 1)"/>
                </div>
                <h2><xsl:value-of select="name"/></h2>
              </div>
              <div class="desc"><xsl:value-of select="description"/></div>
              <div class="levels">
                <xsl:for-each select="levels/availability">
                  <xsl:choose>
                    <xsl:when test=". = 'yes'">
                      <span>
                        <xsl:attribute name="class">
                          level-tag level-<xsl:value-of select="@level"/>
                        </xsl:attribute>
                        <xsl:choose>
                          <xsl:when test="@level='beaver'">Beaver</xsl:when>
                          <xsl:when test="@level='cub'">Cub</xsl:when>
                          <xsl:otherwise>Scout</xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span class="level-tag level-na">
                        <xsl:choose>
                          <xsl:when test="@level='beaver'">Beaver</xsl:when>
                          <xsl:when test="@level='cub'">Cub</xsl:when>
                          <xsl:otherwise>Scout</xsl:otherwise>
                        </xsl:choose>
                      </span>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </div>
            </div>
          </xsl:for-each>
        </div>

        <div class="footer">&#xA9; College Productions Ltd</div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
