function getShader(type) {
    var ret

    // 百叶窗与棋盘
    if ( type === "Blinds_fragmentShader" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;          // 纹理坐标，左上角是(0,0)，右下角为(1,1)
        uniform float qt_Opacity;           // 透明度
        uniform sampler2D effectSource;     // 2D 纹理，即上面定义的 effectSource

        uniform int dir;                    // 方向  0-从左往右  1-从右往左  2-从上往下  3-从下往上
        uniform int rows;                   // 行数
        uniform int cols;                   // 列数
        uniform int percent;                // 百分比

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);     // 通过 qt_TexCoord0 从 effectSource 中取得纹理值

            int x = dir % 2 == 0 ? int(qt_TexCoord0.x * 100.0) : int( (1 - qt_TexCoord0.x) * 100.0 );
            int y = dir % 2 == 0 ? int(qt_TexCoord0.y * 100.0) : int( (1 - qt_TexCoord0.y) * 100.0 );

            int xlen = 100 / cols;
            int ylen = 100 / rows;
            int sx = x / xlen;
            int sy = y / ylen;

            float p = float(percent) / 100.0;
            float alpha = 0.0;

            switch (dir)
            {
            case 0:
            case 1: {
                int xOffset = 0;
                if ( sy % 2 != 0 ) {
                    xOffset = xlen / 2;
                }

                if ( sx * xlen <= x + xOffset && (x + xOffset) % xlen <= int(float(xlen) * p) ) {
                    alpha = 1.0;
                }
            } break;
            case 2:
            case 3: {
                int yOffset = 0;
                if ( sx % 2 != 0 ) {
                    yOffset = ylen / 2;
                }

                if ( sy * ylen <= y + yOffset && (y + yOffset) % ylen <= int(float(ylen) * p) ) {
                    alpha = 1.0;
                }
            } break;
            default: break;
            }

            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    // 劈裂
    if ( type === "Splitting_fragmentShader" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;          // 纹理坐标，左上角是(0,0)，右下角为(1,1)
        uniform float qt_Opacity;           // 透明度
        uniform sampler2D effectSource;     // 2D 纹理，即上面定义的 effectSource

        uniform int dir;                    // 方向  0-左右往中间  1-中间往左右  2-上下往中间  3-中间往上下
        uniform int percent;                // 百分比

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);
            float p = float(percent) / 200.0;

            float alphas[] = float[](
                (1.0 - step(p, qt_TexCoord0.x)) + (step(1.0 - p, qt_TexCoord0.x)),
                1.0 - ((1.0 - step(0.5 - p, qt_TexCoord0.x)) + (step(0.5 + p, qt_TexCoord0.x))),
                (1.0 - step(p, qt_TexCoord0.y)) + (step(1.0 - p, qt_TexCoord0.y)),
                1.0 - ((1.0 - step(0.5 - p, qt_TexCoord0.y)) + (step(0.5 + p, qt_TexCoord0.y)))
                );

            float alpha = alphas[dir] * qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    // 溶解
    if ( type === "Dissolution_fragmentShader" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;
        uniform float qt_Opacity;
        uniform sampler2D effectSource;
        uniform sampler2D dissolutionSource;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);
            vec4 dcolor = texture2D(dissolutionSource, qt_TexCoord0);

            float alpha = 1.0 - step(float(percent) / 100.0, dcolor.r);
            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    // 方盒与圆盒
    if ( type === "Box_fragmentShader" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;
        uniform float qt_Opacity;
        uniform sampler2D effectSource;
        uniform int dir;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);
            float alpha = 0.0;

            switch (dir)
            {
            case 0: {
                float p = float(percent) / 200.0;
                alpha = step(0.5 - p, qt_TexCoord0.x) *
                            (1.0 - step(0.5 + p, qt_TexCoord0.x)) *
                            step(0.5 - p, qt_TexCoord0.y) *
                            (1.0 - step(0.5 + p, qt_TexCoord0.y)) *
                            qt_Opacity;
            } break;
            case 1: {
                float p = float(percent) / 200.0;
                if ( qt_TexCoord0.x <= p || qt_TexCoord0.x >= 1.0 - p ) {
                    alpha = 1.0;
                } else if ( qt_TexCoord0.y <= p || qt_TexCoord0.y >= 1.0 - p ) {
                    alpha = 1.0;
                }
                alpha *= qt_Opacity;
            } break;
            case 2: {
                float p = float(percent) / 100.0;
                float dis = distance(qt_TexCoord0, vec2(0.5, 0.5));
                float antialiseRadius = 0.01;
                alpha = 1.0 - smoothstep(p, p + antialiseRadius,  dis);
                alpha *= qt_Opacity;
            } break;
            case 3: {
                float p = float(percent) / 100.0;
                float dis = distance(qt_TexCoord0, vec2(0.5, 0.5));
                float antialiseRadius = 0.01;
                alpha = smoothstep(1.0 - p ,1.0 - p + antialiseRadius, dis);
                alpha *= qt_Opacity;
            } break;
            default: break;
            }

            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    // 对角线
    if ( type === "Ladder_fragmentShader" )
    {
        ret = "\
        varying vec2 qt_TexCoord0;
        uniform float qt_Opacity;
        uniform sampler2D effectSource;
        uniform int dir;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);
            float p = float(percent) / 100.0;
            float ps[] = float[](2.0 * p - qt_TexCoord0.x - qt_TexCoord0.y,
                                qt_TexCoord0.y - (1.0 - 2.0 *(1.0 -  p)) - qt_TexCoord0.x,
                                qt_TexCoord0.x + (1.0 - 2.0 * p) - qt_TexCoord0.y,
                                qt_TexCoord0.y - 2.0 * (1.0 - p) + qt_TexCoord0.x);
            float alpha = step(0, ps[dir]);
            float alphas[] = float[](alpha, 1.0 - alpha, 1.0 - alpha, alpha);
            alpha = alphas[dir];
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }"
    }

    //------------------------------------------------------------------------------

    return ret
}
