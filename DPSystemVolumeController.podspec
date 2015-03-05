Pod::Spec.new do |s|
  s.name                  = "DPSystemVolumeController"
  s.version               = "0.1"
  s.summary               = "iOS System Volume Hack"
  s.author                = { "Yusuke SUGAMIYA" => "yusuke.dnpp@gmail.com" }
  s.homepage              = "https://github.com/dnpp73/DPSystemVolumeController"
  s.source                = { :git => "https://github.com/dnpp73/DPSystemVolumeController.git", :tag => "#{s.version}" }
  s.ios.source_files      = 'DPSystemVolumeController/**/*.{h,m}'
  # s.ios.resources         = 'DPSystemVolumeController/UserInterface/**/*.{xib,storyboard}'
  s.ios.deployment_target = '6.0'
  s.requires_arc          = true
  
  s.ios.frameworks        = 'AVFoundation', 'MediaPlayer'
  
  s.dependency 'dp_exec_block_on_main_thread'
  
  s.license               = {
   :type => 'MIT',
   :text => <<-LICENSE
   Copyright (c) 2015 Yusuke Sugamiya

   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   LICENSE
  }
end
