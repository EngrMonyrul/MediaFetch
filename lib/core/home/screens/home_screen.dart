import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mediafetch/common/extension/context/context_ext.dart';
import 'package:mediafetch/common/widgets/custom_button.dart';
import 'package:mediafetch/core/home/widgets/paralax_background.dart';
import 'package:mediafetch/utils/constants/asset_const.dart';
import 'package:otacore/otacore.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/available_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*-------------------> variables <-------------------*/
  double topEleven = 0;
  bool loading = false;
  int pageNo = 1;

  /*-------------------> functions <-------------------*/
  bool notificationListen(Notification? notification) {
    if (notification is ScrollUpdateNotification) {
      if (notification.scrollDelta == null) return true;
      setState(() {
        topEleven -= notification.scrollDelta! / 2.0;
      });
    }
    return true;
  }

  void fetchPagPhoto({int? page}) async {
    final pagProvider = context.read<PagProvider>();
    setState(() {
      loading = true;
    });
    await context.read<PagProvider>().fetchPagPhoto(
          totalPage: page!,
          perPageItem: 10,
        );
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    fetchPagPhoto(page: pageNo);
    super.initState();
  }

  /*-------------------> builder <-------------------*/
  @override
  Widget build(BuildContext context) {
    final screenSize = context.screenSize;
    final theme = context.theme;
    final pagProvider = Provider.of<PagProvider>(context);
    return Scaffold(
      /*-------------------> notification listener <-------------------*/
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : NotificationListener(
              onNotification: notificationListen,
              child: Stack(
                children: [
                  /*-------------------> parallax widget <-------------------*/
                  ParalaxBackground(
                    height: screenSize.height / 2,
                    top: topEleven,
                    asset: AssetConsts.sliverBG,
                  ),
                  /*-------------------> body item <-------------------*/
                  SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: screenSize.height / 2.6),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              /*-------------------> total photos <-------------------*/
                              AvailableItem(
                                item: pagProvider.pagPhoto.total_results,
                                label: "Photos",
                              ),
                              const SizedBox(width: 40),
                              /*-------------------> total videos <-------------------*/
                              const AvailableItem(
                                item: 23399,
                                label: "Videos",
                              ),
                              const Spacer(),
                              /*-------------------> search button <-------------------*/
                              const CustomButton(
                                buttonName: "Search Item",
                              ),
                            ],
                          ),
                        ),
                        /*-------------------> title section <-------------------*/
                        Container(
                          // height: MediaQuery.of(context).size.height,
                          // width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: context.topBarHeight + 5),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "MediaFetch",
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Powered By",
                                        style: theme.textTheme.labelSmall
                                            ?.copyWith(
                                          color: theme.colorScheme.tertiary,
                                        ),
                                      ),
                                      Text(
                                        "Pexels",
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6,
                                ),
                                itemCount: pagProvider.pagPhoto.photos!.length,
                                itemBuilder: (context, index) {
                                  final item =
                                      pagProvider.pagPhoto.photos![index];
                                  return Container(
                                    margin: const EdgeInsets.all(3),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: item.src!.original!,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) {
                                          return Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  theme.colorScheme.onTertiary,
                                            ),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircularProgressIndicator(),
                                                Text("Loading..."),
                                              ],
                                            ),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  theme.colorScheme.onTertiary,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text("Error"),
                                                Text(
                                                  "Something went wrong!",
                                                  style: theme
                                                      .textTheme.labelSmall,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: screenSize.width * .3,
                                    child: CustomButton(
                                      onPressed: () {
                                        setState(() {
                                          if (pageNo > 1) {
                                            pageNo--;
                                          }
                                        });
                                        fetchPagPhoto(page: pageNo);
                                      },
                                      buttonName: "Previous",
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * .3,
                                    child: CustomButton(
                                      onPressed: () {
                                        setState(() {
                                          pageNo++;
                                        });
                                        fetchPagPhoto(page: pageNo);
                                      },
                                      buttonName: "Next",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Total ${NumberFormat.compactCurrency(decimalDigits: 2, symbol: "").format(8000)} Item",
                          style: theme.textTheme.labelSmall,
                        ),
                        const Text("Search your favorite item, it's free!"),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
