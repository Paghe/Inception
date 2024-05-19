<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'F;,@{pL6(0zwd89[.e)|)q!|hJ&1z&I]4agg;&*kLs|Ef3VZq>bAbD^[,FAXZ{yi' );
define( 'SECURE_AUTH_KEY',   'UUoC`p :w*<D8/h5.:t;d(Mo?HtqG(C,VsSv6#Si6jZKh4-$gtRsYrIiyY*3=}86' );
define( 'LOGGED_IN_KEY',     'ws_XXlkU%x3R;lkDL5(i8Y{<4|j>6pNmPeBo<V6i@m. ycE?dDTB?8MpZ6phj3))' );
define( 'NONCE_KEY',         'E#/zkTM8l!rei4cjK(BE`(%Ah,Zcs;{(QvI?,33pp=CyF@6&kWmX>LG#5aX,L%{:' );
define( 'AUTH_SALT',         '~Cfvs&hYPB>@kb%vpmGkX((gX5kf~:dvj,_ICjlw#<Qra%l!=T7uFg;?,|j:m.4~' );
define( 'SECURE_AUTH_SALT',  'H*^xv&lntY.Be1ieJvAe&!~U~X4^r6iK9Hl+XuCU{4z^i9?*Zw&b;OXT%;%jQ7d5' );
define( 'LOGGED_IN_SALT',    '(pUV/0[Qj+<5?~$_./[ f6bp<3xRP+id;%1!1]r&q-[HXbqf7e7[Ux57Z)V+1t*|' );
define( 'NONCE_SALT',        'tsjAy$R?u5,S &xG{%Wb-pf^LzrVV89.7%j) Ka5FMXV}8$rv#_ms3y$^aHJVtYE' );
define( 'WP_CACHE_KEY_SALT', '+A(MCgx,3>Q&]b^*%:A(1x/e1>j$:_nmz*1?=DZGydioDDxhU{$PVE:,&vhXl}z(' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
