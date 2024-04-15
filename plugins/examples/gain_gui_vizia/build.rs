fn main() {
    let target = std::env::var("TARGET").unwrap();
    if target == "aarch64-unknown-linux-gnu" {
        let sysroot = std::env::var("AARCH64_UNKNOWN_LINUX_SYSROOT").unwrap();
        println!("cargo::rustc-link-search={sysroot}/usr/lib/aarch64-linux-gnu");
        println!("cargo::rustc-link-search={sysroot}/lib/aarch64-linux-gnu");
        println!("cargo::rustc-link-lib=Xau");
        println!("cargo::rustc-link-lib=Xdmcp");
        println!("cargo::rustc-link-lib=GLdispatch");
        println!("cargo::rustc-link-lib=GLX");
        println!("cargo::rustc-link-lib=Xrender");
        println!("cargo::rustc-link-lib=Xfixes");
        println!("cargo::rustc-link-arg=-Wl,--unresolved-symbols=ignore-in-shared-libs");
    }
}
