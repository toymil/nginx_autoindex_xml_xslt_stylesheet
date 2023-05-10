<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="uri" />

    <xsl:template match="/">
        <html>

        <head>
            <style>
                body {
                    font-family: var(--font-family-ui) monospace;
                }
                .col-modification,
                .col-size,
                #to-parent {
                    font-family: var(--font-family-fixed) monospace;
                }

                table {
                    text-align: start;
                }
                th {
                    text-align: inherit;
                }
                .col-type,
                td.col-modification,
                .col-size {
                    text-align: end;
                }

                th,
                td {
                    padding: 0.5ex 1em;
                }

                thead tr {
                    background-color: rgb(235, 235, 235);
                }
                tbody tr:nth-child(odd) {
                    background-color: rgb(245, 245, 245);
                }
                tbody tr:nth-child(even) {
                    background-color: rgb(250, 250, 250);
                }
            </style>
        </head>

        <body>
            <h1>&gt; <xsl:value-of select="$uri" /></h1>

            <table>

                <colgroup>
                    <col class="col-type" />
                    <col class="col-name" />
                    <col class="col-modification" />
                    <col class="col-size" />
                </colgroup>

                <thead>
                    <tr>
                        <th class="col-type">TYPE</th>
                        <th class="col-name">NAME</th>
                        <th class="col-modification">MODIFICATION</th>
                        <th class="col-size">SIZE</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td></td>
                        <td id="to-parent"><a href="../">../</a></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <xsl:for-each select="list/*">
                        <tr>
                            <td class="col-type">
                                <xsl:choose>
                                    <xsl:when test="local-name() = 'directory'">dir</xsl:when>
                                    <xsl:when test="local-name() = 'file'">file</xsl:when>
                                    <xsl:otherwise>!!!</xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td class="col-name">
                                <xsl:variable name="name">
                                    <xsl:value-of select="." />
                                    <xsl:if test="local-name() = 'directory'">/</xsl:if>
                                </xsl:variable>
                                <a href="{$name}"><xsl:value-of select="$name" /></a>
                            </td>
                            <td class="col-modification">
                                <xsl:value-of select="substring(@mtime, 1, 10)" />
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="substring(@mtime, 12, 8)" />
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="substring(@mtime, 20)" />
                            </td>
                            <td class="col-size">
                                <xsl:choose>
                                    <xsl:when test="string-length(@size) &gt; 0">
                                        <xsl:choose>
                                            <xsl:when test="(@size div 1024) &lt; 1">
                                                <xsl:value-of select="@size" />
                                                &#160;&#160;B
                                            </xsl:when>
                                            <xsl:when test="(@size div 1048576) &lt; 1">
                                                <xsl:value-of select="format-number((@size div 1024), '0.0')" />
                                                KiB
                                            </xsl:when>
                                            <xsl:when test="(@size div 1073741824) &lt; 1">
                                                <xsl:value-of select="format-number((@size div 1048576), '0.0')" />
                                                MiB
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="format-number((@size div 1073741824), '0.0')" />
                                                GiB
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>-</xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>

            </table>
        </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
