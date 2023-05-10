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
            </style>
        </head>

        <body>
            <p>uri: <xsl:value-of select="$uri" /></p>
            <table>

                <tr>
                    <th>TYPE</th>
                    <th>NAME</th>
                    <th>MODIFICATION</th>
                    <th>SIZE</th>
                </tr>

                <xsl:for-each select="list/*">
                    <tr>
                        <td><xsl:value-of select="local-name()" /></td>
                        <td><xsl:value-of select="." /></td>
                        <td><xsl:value-of select="@mtime" /></td>
                        <td><xsl:value-of select="@size" /></td>
                    </tr>
                </xsl:for-each>

            </table>
        </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
