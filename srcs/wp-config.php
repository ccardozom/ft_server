<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'phpmyadmin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'chacoparaguayo' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '^qZE[ZIe8]XJ0`,pNI]|m*=3@= @?DXIvVcJk t<;upkT8oe+KI91IIJSJ{~ZhcG');
define('SECURE_AUTH_KEY',  '<d~@N),XF*Yv?zT[ec#GpcB^]4H9v0eBf#xG@S-<R(Nh)7-14u*DL%@0j* rk|~|');
define('LOGGED_IN_KEY',    'xl9!J+|eHS|jr+.x.<YIZ<Sf4c OcmLo->Eo`8f?,bi}Ucn[,vG|=@p&D:ENFQiY');
define('NONCE_KEY',        'Bh8i^Ouvi!q!T3D,+B}v28.%rD- z_Z44:rt7n^EnJ.)^_XRs7fYicYtV-|hnMd_');
define('AUTH_SALT',        'N/@~Nc</b3!|+ fB-T/=H_(I0qa[wXV_P8%wB9P6XQNN4g~ZS`{`CE&r^|/29z6|');
define('SECURE_AUTH_SALT', '4of)x/.n%mA!abNl&Q9 qHnT,%7;CLu-?NS7OR|x)Db`ljVVH-L8ABF^[2S$3W!I');
define('LOGGED_IN_SALT',   '>}bT:s8uV> $~h|$lp&A%^~5zD|uawtI ^&;AL^MQ#[M7=%ve-7A!$m/j}%M~jv%');
define('NONCE_SALT',       'hQ^Pk:C0DxhD]o?Ud&O[_Rj+@*JN!BSo3x4#qKQoj|i*L1Y!P4XbAl?l|6Rd{!,O');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
