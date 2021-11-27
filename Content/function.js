function getShader(type) {
    var ret

    // 百叶窗 - 从左往右
    if ( type === "Blinds_fragmentShader_1" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;          // 共享纹理坐标
        uniform float qt_Opacity;           // 透明度
        uniform sampler2D effectSource;     // 2D 纹理，即上面定义的 effectSource

        uniform int rows;
        uniform int cols;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);

            int xlen = 100 / cols;
            int ylen = 100 / rows;

            float p = float(percent) / 100.0;
            int x = int(qt_TexCoord0.x * 100.0);
            int y = int(qt_TexCoord0.y * 100.0);
            int sx = x / xlen;
            int sy = y / ylen;

            int xOffset = 0;
            if ( sy % 2 != 0 ) {
                xOffset = xlen / 2;
            }

            float alpha = 0.0;
            if ( sx * xlen <= x + xOffset && (x + xOffset) % xlen <= int(float(xlen) * p) ) {
                alpha = 1.0;
            }

            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    // 百叶窗 - 从右往左
    else if ( type === "Blinds_fragmentShader_2" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;          // 共享纹理坐标
        uniform float qt_Opacity;           // 透明度
        uniform sampler2D effectSource;     // 2D 纹理，即上面定义的 effectSource

        uniform int rows;
        uniform int cols;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);

            int xlen = 100 / cols;
            int ylen = 100 / rows;

            float p = float(percent) / 100.0;
            int x = int(qt_TexCoord0.x * 100.0);
            int y = int(qt_TexCoord0.y * 100.0);
            int sx = x / xlen;
            int sy = y / ylen;

            int xOffset = 0;
            if ( sy % 2 != 0 ) {
                xOffset = xlen / 2;
            }

            float alpha = 0.0;
            if ( sx * xlen <= x + xOffset && (x + xOffset) % xlen <= int(float(xlen) * p) ) {
                alpha = 1.0;
            }

            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    // 百叶窗 - 从上往下
    else if ( type === "Blinds_fragmentShader_3" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;          // 共享纹理坐标
        uniform float qt_Opacity;           // 透明度
        uniform sampler2D effectSource;     // 2D 纹理，即上面定义的 effectSource

        uniform int rows;
        uniform int cols;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);

            int xlen = 100 / cols;
            int ylen = 100 / rows;

            float p = float(percent) / 100.0;
            int x = int(qt_TexCoord0.x * 100.0);
            int y = int(qt_TexCoord0.y * 100.0);
            int sx = x / xlen;
            int sy = y / ylen;

            int yOffset = 0;
            if ( sx % 2 != 0 ) {
                yOffset = ylen / 2;
            }

            float alpha = 0.0;
            if ( sy * ylen <= y + yOffset && (y + yOffset) % ylen <= int(float(ylen) * p) ) {
                alpha = 1.0;
            }

            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    // 百叶窗 - 从下往上
    else if ( type === "Blinds_fragmentShader_4" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;          // 共享纹理坐标
        uniform float qt_Opacity;           // 透明度
        uniform sampler2D effectSource;     // 2D 纹理，即上面定义的 effectSource

        uniform int rows;
        uniform int cols;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);

            int xlen = 100 / cols;
            int ylen = 100 / rows;

            float p = float(percent) / 100.0;
            int x = int(qt_TexCoord0.x * 100.0);
            int y = int(qt_TexCoord0.y * 100.0);
            int sx = x / xlen;
            int sy = y / ylen;

            int yOffset = 0;
            if ( sx % 2 != 0 ) {
                yOffset = ylen / 2;
            }

            float alpha = 0.0;
            if ( sy * ylen <= y + yOffset && (y + yOffset) % ylen <= int(float(ylen) * p) ) {
                alpha = 1.0;
            }

            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    //------------------------------------------------------------------------------

    return ret
}
