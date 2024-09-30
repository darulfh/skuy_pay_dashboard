import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skuy_pay_dashboard/models/ppd/ppd_api.dart';
import 'package:skuy_pay_dashboard/models/ppd/ppd_data.dart';
import 'package:skuy_pay_dashboard/models/ppd/ppd_params.dart';
import 'package:skuy_pay_dashboard/utils/const/toast.dart';

part 'ppd_state.dart';

class PpdCubit extends Cubit<PpdState> {
  PpdCubit() : super(PpdInitial());

  PpdParams params = const PpdParams();

  void setParams(Function(PpdParams) params) {
    this.params = params(this.params);
  }

  void checkPpd() {
    if (state is PpdInitial || state is PpdError) {
      getPpd();
    }
  }

  void search(String search, bool isPulsa) {
    final state = this.state;
    if (state is PpdSuccess) {
      if (isPulsa) {
        emit(PpdSuccess(
          pulsa: state.pulsa,
          paketData: state.paketData,
          searchPulsa: state.pulsa
              .where((element) => element
                  .toJson()
                  .toString()
                  .toLowerCase()
                  .contains(search.toLowerCase()))
              .toList(),
          searchPaketData: state.paketData,
        ));
      } else {
        emit(PpdSuccess(
          pulsa: state.pulsa,
          paketData: state.paketData,
          searchPulsa: state.pulsa,
          searchPaketData: state.paketData
              .where((element) => element
                  .toJson()
                  .toString()
                  .toLowerCase()
                  .contains(search.toLowerCase()))
              .toList(),
        ));
      }
    }
  }

  Future<void> getPpd() async {
    if (state is PpdLoading) return;
    emit(PpdLoading());

    List<PpdData> pulsa = [];
    List<PpdData> paketData = [];

    PpdApi.getPpd(params).then((value) {
      for (var element in value) {
        if (element.type == "pulsa") {
          pulsa.add(element);
        } else {
          paketData.add(element);
        }
      }
      emit(PpdSuccess(
        pulsa: pulsa,
        paketData: paketData,
        searchPulsa: pulsa,
        searchPaketData: paketData,
      ));
    }).catchError((e) {
      toast(e.toString());
      emit(PpdError(e.toString()));
    });
  }

  Future<void> createPpd(PpdData data) async {
    bool isPulsa = data.type == "pulsa";
    List<PpdData> oldPulsaData = [];
    List<PpdData> oldPaketData = [];

    if (state is PpdSuccess) {
      oldPulsaData = (state as PpdSuccess).pulsa;
      oldPulsaData = (state as PpdSuccess).paketData;
    }
    emit(PpdCreateLoading());

    PpdApi.createPpd(data).then((value) {
      if (isPulsa) {
        emit(
          PpdSuccess(
            pulsa: [value, ...oldPulsaData],
            paketData: oldPaketData,
            searchPulsa: [value, ...oldPulsaData],
            searchPaketData: oldPaketData,
          ),
        );
      } else {
        emit(PpdSuccess(
          pulsa: oldPulsaData,
          paketData: [value, ...oldPaketData],
          searchPulsa: oldPulsaData,
          searchPaketData: [value, ...oldPaketData],
        ));
      }
    }).catchError((e) {
      toast(e.toString());
      emit(PpdError(e.toString()));
    });
  }

  Future<void> updatePpd(PpdData data) async {
    bool isPulsa = data.type == "pulsa";
    List<PpdData> oldPulsaData = [];
    List<PpdData> oldPaketData = [];

    if (state is PpdSuccess) {
      oldPulsaData = (state as PpdSuccess).pulsa;
      oldPulsaData = (state as PpdSuccess).paketData;
    }

    emit(PpdUpdateLoading());

    PpdApi.updatePpd(data).then((value) {
      if (isPulsa) {
        emit(PpdSuccess(
          pulsa: oldPulsaData.map((e) => e.id == value.id ? value : e).toList(),
          paketData: oldPaketData,
          searchPaketData: oldPaketData,
          searchPulsa:
              oldPulsaData.map((e) => e.id == value.id ? value : e).toList(),
        ));
      } else {
        emit(PpdSuccess(
            searchPulsa: oldPulsaData,
            pulsa: oldPulsaData,
            searchPaketData:
                oldPaketData.map((e) => e.id == value.id ? value : e).toList(),
            paketData: oldPaketData
                .map((e) => e.id == value.id ? value : e)
                .toList()));
      }
    }).catchError((e) {
      toast(e.toString());
      emit(PpdError(e.toString()));
    });
  }

  Future<void> deletePpd(String id, bool isPulsa) async {
    List<PpdData> oldPulsaData = [];
    List<PpdData> oldPaketData = [];

    if (state is PpdSuccess) {
      oldPulsaData = (state as PpdSuccess).pulsa;
      oldPulsaData = (state as PpdSuccess).paketData;
    }
    emit(PpdDeleteLoading());

    PpdApi.deletePpd(id).then((value) {
      if (isPulsa) {
        emit(PpdSuccess(
            searchPulsa:
                oldPulsaData.where((element) => element.id != id).toList(),
            pulsa: oldPulsaData.where((element) => element.id != id).toList(),
            paketData: oldPaketData,
            searchPaketData: oldPaketData));
      } else {
        emit(PpdSuccess(
          pulsa: oldPulsaData,
          searchPulsa: oldPulsaData,
          searchPaketData:
              oldPaketData.where((element) => element.id != id).toList(),
          paketData: oldPaketData.where((element) => element.id != id).toList(),
        ));
      }
    }).catchError((e) {
      toast(e.toString());
      emit(PpdError(e.toString()));
    });
  }
}
