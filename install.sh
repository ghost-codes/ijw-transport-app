#!/bin/bash

echo 'Installing all needed packaged ============>'
echo '''
    Json Serializable
    Json annotation
    Build runner
    Get It
    Dio
    Shared Preferences
    Flutter Secure Storage
    Go router
    Flutter svg
    Local Notification
    Firebase Messaging
    Focus Detector
    Equatable
    Flutter Hooks
    Uni links
'''

flutter pub add build_runner get_it json_serializable json_annotation shared_preferences flutter_secure_storage dio firebase_messaging flutter_local_notifications go_router flutter_svg focus_detector equatable flutter_hooks uni_links
