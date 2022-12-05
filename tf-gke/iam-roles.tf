
resource "google_project_iam_binding" "iam-cloudtrace-agent" {
    project = var.project_id
    role = "roles/cloudtrace.agent"
    members = [
        "serviceAccount:${var.default_service_account}",
    ]
}
