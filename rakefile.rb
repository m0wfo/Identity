desc "Compile class into a bundle"
task :build do
  system("gcc -bundle -framework Cocoa -framework IOKit -framework Foundation -fobjc-gc -o build/Identity.bundle lib/Identity.m")
end