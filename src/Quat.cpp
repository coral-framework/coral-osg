#include "Quat_Adapter.h"

namespace coOsg
{
	double Quat_Adapter::getW( coOsg::Quat& instance )
	{
		return instance.w();
	}

	void Quat_Adapter::setW( coOsg::Quat& instance, double value )
	{
		instance.w() = value;
	}

	double Quat_Adapter::getX( coOsg::Quat& instance )
	{
		return instance.x();
	}

	void Quat_Adapter::setX( coOsg::Quat& instance, double value )
	{
		instance.x() = value;
	}

	double Quat_Adapter::getY( coOsg::Quat& instance )
	{
		return instance.y();
	}

	void Quat_Adapter::setY( coOsg::Quat& instance, double value )
	{
		instance.y() = value;
	}

	double Quat_Adapter::getZ( coOsg::Quat& instance )
	{
		return instance.z();
	}

	void Quat_Adapter::setZ( coOsg::Quat& instance, double value )
	{
		instance.z() = value;
	}

	void Quat_Adapter::fromMatrix( coOsg::Quat& instance, const coOsg::Matrix& matrix )
	{
		instance.set( matrix );
	}

	void Quat_Adapter::getRotate( coOsg::Quat& instance, double& angle, coOsg::Vec3& axis )
	{
		instance.getRotate( angle, axis );
	}

	void Quat_Adapter::makeRotate( coOsg::Quat& instance, double radians, const coOsg::Vec3& axis )
	{
		instance.makeRotate( radians, axis );
	}

	void Quat_Adapter::postMult( coOsg::Quat& instance, const coOsg::Quat& other )
	{
		instance = other * instance;
	}

	void Quat_Adapter::preMult( coOsg::Quat& instance, const coOsg::Quat& other )
	{
		instance *= other;
	}

	void Quat_Adapter::slerp( coOsg::Quat& instance, double t, const coOsg::Quat& from, const coOsg::Quat& to )
	{
		instance.slerp( t, from, to );
	}

	void Quat_Adapter::toMatrix( coOsg::Quat& instance, coOsg::Matrix& matrix )
	{
		instance.get( matrix );
	}

	bool Quat_Adapter::zeroRotation( coOsg::Quat& instance )
	{
		instance.zeroRotation();
	}
} // namespace coOsg
