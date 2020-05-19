provider "local" {}

variable "sample" {}

resource "local_file" "foo" {
    content     = "Content = ${var.sample}\n"
    filename = "/sample/abc"
}

