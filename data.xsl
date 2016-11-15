<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <meta name="author" content="Jesse Hutchison" />
        <link rel="stylesheet" type="text/css" href="styles/reset.css" />
        <link rel="stylesheet" type="text/css" href="styles/guild.css" />
      </head>
      <body style="background-color: #CCCCCC;">
        <div id="monsterlog">
          <h1><img src="https://dl.dropboxusercontent.com/u/63437940/ZombieMUD/images/zombiehead.jpg" width="18" height="20" style="vertical-align: middle;" /> Psychoza's ZombieMUD Monster Log <img src="https://dl.dropboxusercontent.com/u/63437940/ZombieMUD/images/zombiehead.jpg" width="18" height="20" style="vertical-align: middle;" /></h1>
          <h2>
            <a href="http://zombiemud.org/">
              <img src="https://dl.dropboxusercontent.com/u/63437940/ZombieMUD/images/banner1c.jpg" alt="Join us at ZombieMUD.org" width="88" height="31" border="0" />
            </a>
          </h2>
          <br />
          <br />
          <h2>-This is very much a Work In Progress-</h2>
          <br />
          <div class="infospan">
            <xsl:for-each select="Database/Areas/Area">
              <xsl:sort select="Name"/>
              -<a><xsl:attribute name="href">data.xml#<xsl:value-of select="Name"/></xsl:attribute><xsl:value-of select="Name"/></a>
            </xsl:for-each><br /><br />
            Areas.......<xsl:value-of select="count(Database/Areas/Area)" /><br />
            Monsters...<xsl:value-of select="count(Database/Areas/Area/Monsters/Monster)" /><br />
            Items......<xsl:value-of select="count(Database/Areas/Area/Monsters/Monster/Loot/Item)" />
          </div>
          <br />
          <table>
            <tr>
              <th>Area</th>
              <th>Coder</th>
              <th>Directions From/To CS</th>
              <th>Monsters</th>
            </tr>
            <xsl:for-each select="Database/Areas/Area">
              <xsl:sort select="Name"/>
              <tr>
                <td class="area">
                  <a target="monster_log_map"><xsl:attribute name="name"><xsl:value-of select="Name"/></xsl:attribute><xsl:attribute name="href"><xsl:value-of select="Map"/></xsl:attribute><xsl:value-of select="Name"/></a>
                </td>
                <td class="coder"><xsl:value-of select="Coder"/></td>
                <td class="directions">To:<br/><xsl:value-of select="Directions/To"/><br/><br/>From:<br/><xsl:value-of select="Directions/From"/></td>
                <td class="monsters">
                  <table>
                    <tr>
                      <th>Monster's Name</th>
                      <th>Exp Worth</th>
                      <th>Alignment</th>
                      <th>Skills/Spells</th>
                      <th>Dropped Loot</th>
                    </tr>
                    <xsl:for-each select="Monsters/Monster">
                    <xsl:sort select="Worth" data-type="number"/>
                    <xsl:sort select="Name"/>
                      <tr>
                        <td class="monstersname"><xsl:value-of select="Name"/></td>
                        <td class="monstersworth"><xsl:value-of select="Worth"/></td>
                        <td class="monstersalignment"><xsl:value-of select="Alignment"/></td>
                        <td class="monstersskillspell">
                          <table>
                            <xsl:for-each select="SkillSpells/SkillSpell">
                            <xsl:sort select="Name"/>
                              <tr>
                                <td class="skillspell"><xsl:value-of select="Name"/></td>
                              </tr>
                            </xsl:for-each>
                          </table>
                        </td>
                        <td class="monstersloot">
                          <table>
                            <xsl:for-each select="Loot/Item">
                            <xsl:sort select="Name"/>
                              <tr>
                                <td class="loot"><span><xsl:attribute name="title"><xsl:value-of select="Desc"/></xsl:attribute><xsl:value-of select="Name"/></span></td>
                              </tr>
                            </xsl:for-each>
                          </table>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
