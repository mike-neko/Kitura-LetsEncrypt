import Kitura
import HeliumLogger

// TODO: change domain
let domain = "example.com"

// Initialize HeliumLogger
HeliumLogger.use()

// Initialize SSL
let caPath = "/etc/letsencrypt/live/\(domain)/"
let certPath = "/etc/letsencrypt/live/\(domain)/cert.pem"
let keyPath = "/etc/letsencrypt/live/\(domain)/privkey.pem"
let sslConfig = SSLConfig(withCACertificateDirectory: caPath,
                          usingCertificateFile: certPath,
                          withKeyFile: keyPath,
                          usingSelfSignedCerts: false)

// Create a new router
let router = Router()
router.all(middleware: StaticFileServer())

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 80, with: router)
Kitura.addHTTPServer(onPort: 443, with: router, withSSL: sslConfig)

// Start the Kitura runloop (this call never returns)
Kitura.run()
