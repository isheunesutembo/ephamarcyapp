

import 'package:ephamarcyapp/pages/home.dart';
import 'package:ephamarcyapp/pages/signin.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute=RouteMap(routes:{'/':(_)=>MaterialPage(child: SignIn())});

final loggedInRoute=RouteMap(routes: {'/':(_)=>MaterialPage(child: Home())});