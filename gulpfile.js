var gulp        = require('gulp'),

    del         = require('del'),
    path        = require('path'),

    concat      = require('gulp-concat'),
    copy        = require('gulp-copy'),
    postcss     = require('gulp-postcss'),
    sass        = require('gulp-sass'),
    svgmin      = require('gulp-svgmin')
    svgstore    = require('gulp-svgstore'),
    uglify      = require('gulp-uglify'),

    flexfix     = require('postcss-flexbugs-fixes'),
    mqpack      = require('css-mqpacker'),
    minify      = require('cssnano'),
    pixrem      = require('pixrem'),
    prefix      = require('autoprefixer');


gulp.task('clean', function () {
    return del(['dist']);
});


gulp.task('files', ['clean'], function () {
    return gulp
        .src(['*.tpl', '*.php', 'UTF-8/*.php', '*.txt'])
        .pipe(copy('dist'));
});


gulp.task('icons', ['clean'], function () {
    return gulp
        .src('icons/*.svg')
        .pipe(svgmin(function (file) {
            var prefix = path.basename(file.relative, path.extname(file.relative));
            return {
                plugins: [{
                    cleanupIDs: {
                        prefix: prefix + '-',
                        minify: true
                    }
                }]
            }
        }))
        .pipe(svgstore())
        .pipe(gulp.dest('dist/img'))
});


gulp.task('scripts', ['clean'], function () {
    return gulp
        .src([
            'node_modules/svg4everybody/dist/svg4everybody.js',
            'theme.js'
        ])
        .pipe(concat('theme.js'))
        .pipe(uglify())
        .pipe(gulp.dest('dist'));
});


gulp.task('styles', ['clean'], function () {
    var plugins = [
        prefix({
            browsers: ['> 1%', 'last 2 versions'],
            cascade: false,
            remove: true
        }),
        pixrem({
            atrules: true,
            unitPrecision: 0
        }),
        flexfix(),
        mqpack({
            sort: true
        }),
        minify()
    ];

    return gulp
        .src('style.scss')
        .pipe(sass({
            outputStyle: 'nested',
            precision: 5
        }).on('error', sass.logError))
        .pipe(postcss(plugins))
        .pipe(gulp.dest('dist'));
});


gulp.task('default', ['files', 'icons', 'scripts', 'styles']);