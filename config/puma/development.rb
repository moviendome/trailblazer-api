# frozen_string_literal: true

threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port        3000, "0.0.0.0"

environment "development"

debug
