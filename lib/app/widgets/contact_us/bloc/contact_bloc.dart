import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trainee_task/app/utility/shared_services/api_services.dart';
import 'package:trainee_task/app/utility/shared_widgets/repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

// class ContactBloc extends Bloc<ContactEvent, ContactState> {
//   late ContactAPI data;
//   final ContactRepo contactRepo;

//   ContactBloc(this.contactRepo) : super(ContactInitial()) {
//     on<ContactEvent>((event, emit) async {
//       if (event is SendData) {
//         emit(ContactLoading());
//         await Future.delayed(const Duration(seconds: 3), () async {
//           data = await contactRepo.fetchDetails(
//               event.firstName,
//               event.lastName,
//               event.email,
//               event.mobile,
//               event.msgTitle,
//               event.msgType,
//               event.msgDesc,
//               event.attachment);
//           emit(ContactLoaded(data));
//         });
//       }
//     });
//   }
// }
