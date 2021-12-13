module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-workload-pool-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}