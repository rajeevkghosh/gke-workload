module "tfplan-functions" {
  source = "../../tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-workload-pool-null.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}