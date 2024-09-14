{{/*
Expand the name of the chart.
*/}}
{{- define "wakapi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Expand the full name of the release, which includes the release name.
*/}}
{{- define "wakapi.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/*
Create common labels to be used across all resources.
*/}}
{{- define "wakapi.labels" -}}
helm.sh/chart: {{ include "wakapi.chart" . | quote }}
app.kubernetes.io/name: {{ include "wakapi.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Generate a chart label, which includes the chart name and version.
*/}}
{{- define "wakapi.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

{{/*
Common selector labels to be used in selectors and matchLabels.
*/}}
{{- define "wakapi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wakapi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Expand the full name of the wakatime exporter.
*/}}
{{- define "wakapi.exporter.fullname" -}}
{{- printf "%s-%s" .Release.Name "exporter" | trunc 63 | trimSuffix "-" -}}
{{- end }}